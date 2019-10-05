function DistLoadFlowDGSolution=powerflowDG(DG,llo)
%% THIS CODE WORKS FOR DIFFERENT TYPES OF LOADS IN SINGLE PHASE RADIAL 
%% NETWORK, e.g. Z-TYPE(1),I-TYPE(2),PQ-TYPE(3) AND ZIP-TYPE(4), 
%% FOR DEFINING DIFFERENT TYPES OF LOADS SEE 'Type-COLUMN' OF bus MATRIX in case33radial.m FILE
[baseMVA,bus,branch]=case33radial; % calling data from data file
[Zt,It,PQt,ZIPt,BUS_I,PD,QD,BS,TYPE,VM,VA,BASE_KV,VMAX,VMIN]=idx_bus;
[F_BUS,T_BUS,BR_R,BR_X,BR_STATUS,TAP,RATE_A]=idx_branch;

bus(llo,PD)=bus(llo,PD)-DG;

stat=branch(:,BR_STATUS);
branch(find(stat==0),:)=[]; % Actual branch matrix in which current flowing
nl=length(branch(:,F_BUS));% Total No. of branches in service
nb=length(bus(:,BUS_I));% Total no. of buses
baseKV=max(bus(:,BASE_KV));
Zbase=(baseKV^2)/baseMVA; % base impedance
R=branch(:,BR_R)/Zbase; % Line resistance in p.u. as R in ohms
X=branch(:,BR_X)/Zbase; % Line Reactance in p.u.
j=sqrt(-1);% defining iota
Z=R+j*X; % Impedance in p.u.
[BIBC,DLF]=makeBIBCandDLF(baseMVA,baseKV,bus,branch); % Calling BIBC and DLF matrix
bus(1,:)=[]; % Needs to be remove for indexing other buses
bus(:,1)=1:(nb-1);

% As per ELM data
VB=bus(:,VM);
Vmm=abs(VB);
P=bus(:,PD)/(baseMVA*1000); % in p.u. as P in kW
% P=P.*(Vmm.^2);
Q=(bus(:,QD)-bus(:,BS))./(baseMVA*1000); % in p.u. as Q in kVAr
% Q=Q.*(Vmm.^2);
S=P+j*Q;% Apprent power(p.u.)


%%VB=bus(:,VM);% Vector of Voltage magnitude
I=zeros((nb-1),1);% Zeros vector of Node current (except node 1)

%% CALCULATION OF DIFFERENT TYPES OF LOADS AT RATED VOLTAGE BEGINS HERE
for kk=1:length(bus(:,1))
if bus(kk,TYPE)==Zt
    %disp('Provided System data have CONSTANT IMPREDANCE type load')
ZB = find(bus(:, TYPE) == Zt);   %% bus indices where Z load connected
ZL=[bus(ZB,BUS_I) bus(ZB,PD) bus(ZB,QD)];%%I loading with bus number
ZL(find(ZL(:,2)==0),:)=[];
Zb=ZL(:,1);
Zload=(VB(Zb).^2)./conj(S(Zb)); %Z-load at rated voltage
elseif bus(kk,TYPE)==It
    %disp('Provided System data have CONSTANT CURRENT type load')
IB  = find(bus(:, TYPE) == It);   %% bus indices where I load connected
IL=[bus(IB,BUS_I) bus(IB,PD) bus(IB,QD)];%%I loading with bus number
IL(find(IL(:,2)==0),:)=[];
Ib=IL(:,1);
IM=abs(conj(S(Ib)./VB(Ib)));
IMa=angle(conj(S(Ib)./VB(Ib)));
elseif bus(kk,TYPE)==PQt
    %disp('Provided System data have CONSTANT COMPLEX POWER type load')
PQB  = find(bus(:, TYPE) == PQt );   %% bus indices where PQ load connected
PQL=[bus(PQB,BUS_I) bus(PQB,PD) bus(PQB,QD)];%%PQ loading with bus number
%PQL(find(PQL(:,2)==0),:)=[];
PQb=PQL(:,1);
Sload=S(PQb);
Pfr=PQL(:,2);
Qfr=PQL(:,3);
elseif bus(kk,TYPE)==ZIPt
    %disp('Provided System data have MIXED("ZIP") type load')
    % ZP,IP AND SP ARE NOT FIXED: BEFORE RUNNING THIS CHANGE THESE VALUES
    % AS PER STATNDARD REFERENCE
    % These are ZIP Coeficients. These can be edited according to choice of user 
    ZP=0.69;%input('Percentage of Z-Type load=');
    IP=0.21;%input('Percentage of I-Type load=');
    SP=0.1;%input('Percentage of PQ-Type load=');
    
    % Rembember ZP+IP+SP=1
    
ZIPb=find(bus(:,TYPE)==ZIPt); %% bus indices where PQ load connected
Zzip=(VB(ZIPb).^2)./conj(S(ZIPb));
IMzip=abs(conj(S(ZIPb)./VB(ZIPb)));
IMazip=angle(conj(S(ZIPb)./VB(ZIPb)));
Szip=S(ZIPb);

 end
end
% CALCULATION OF DIFFERENT TYPES OF LOADS AT RATED VOLTAGE ENDS HERE

zzz=ones(nb-1);
V=zzz(:,1);
VB=V;
%% FORWARD AND BACKWARD SWEEP POWER FLOW BEGINS HERE
iter=1000; % Can be changed (if taking more time)
for i=1:iter
     %%Backward Sweep
     for ll=1:length(bus(:,1))
         if bus(ll,TYPE)==Zt
     IZ=VB(Zb)./Zload; % Current for Z loads
     I(Zb)=IZ;
         elseif bus(ll,TYPE)==It
     II=(IM.*(cos(angle(VB(Ib))-angle(S(Ib)))+j*sin(angle(VB(Ib))-angle(S(Ib)))));% Current for I loads
     I(Ib)=II;
             elseif bus(ll,TYPE)==PQt
     IPQ=conj(Sload./VB(PQb)); % Current for PQ loads
     I(PQb)=IPQ;
         elseif bus(ll,TYPE)==ZIPt
     Iz=(VB(ZIPb)./Zzip)*ZP;% Pectage of current flowing in Z-type loading
     Ii=(IMzip.*(cos(angle(VB(ZIPb))-angle(Szip))+j*sin(angle(VB(ZIPb))-angle(Szip))))*IP;% Percentage of current flowing in I-type loading
     Ipq=(conj(Szip./VB(ZIPb)))*SP;% Percentage of current flowing in PQ-type loading
     IZIP=Iz+Ii+Ipq;% Total current for ZIP load
     I(ZIPb)=IZIP;
         end
     end
    IBr=BIBC*I;  %Branch current
    delV=DLF*I; % Voltage drop w.r.t. substation bus
    VB=V-delV;  % Bus Voltage except S/S Bus
end
seep=numel(Pfr);
seeq=numel(Qfr);
% FORWARD AND BACKWARD SWEEP POWER FLOW ENDS HERE

Vn=[1.00;VB];% VECTOR OF COMPLEX VOLTAGE
Vm=abs(Vn);% VECTOR OF VOLTAGE MAGNITUDE
Va=angle(Vn)*180/pi;
f=branch(:,F_BUS);
t=branch(:,T_BUS);
for l=1:nl
    VFT(l,:)=Vn(f(l))-Vn(t(l));
    Vmi(l,:)=Vn(f(l));                  %Calculating parameter for VSI Vmi = sending node voltage
end
tt=1:numel(t);
for w=1:nl
    aPfr=Pfr(tt(w))./(baseMVA*1000);
    aQfr(w,:)=Qfr(tt(w))./(baseMVA*1000);
    Rfr(w,:)=R(tt(w));
    Xfr(w,:)=X(tt(w));
end

Vmi=abs(Vmi);
Vft=abs(VFT);
Pbrloss=((Vft.^2).*R)./(abs(Z).*abs(Z))*10^5; % Each Line Loss in kWs
Qbrloss=((Vft.^2).*X)./(abs(Z).*abs(Z))*10^5; % Each Line Loss in kVAr
PtLosskW=sum(Pbrloss); % Total Line Losses in kW
QtLosskVAr=sum(Qbrloss); % Total Line Losses in kVAr
SLosskVA=abs(PtLosskW+sqrt(-1)*QtLosskVAr);
vsi = (abs(Vmi.^4))-4*(aPfr.*Rfr + aQfr.*Xfr).*(abs(Vmi.^2))...
    -4*(aPfr.*Rfr + aQfr.*Xfr).^2;
VSIsorted=sortrows([vsi,bus(:,BUS_I)]);
minvsi=min(vsi);

%% Calculating Voltage Stability Factor

% Vactl=abs(baseKV*Vn);
VSFsum=0;
% for kkk=1:nb-1
% VSF(kkk,:)=2*Vactl(kkk+1)-Vactl(kkk);
% VSFsum=VSFsum +(2*Vactl(kkk+1)-Vactl(kkk));
% end

for kkk=1:nb-1
VSF(kkk,:)=2*Vm(kkk+1)-Vm(kkk);
VSFsum=VSFsum +(2*Vm(kkk+1)-Vm(kkk));
end

Viref=1;         % refrence voltage in pu
VDI = ((Viref - Vm)/Viref).^2;
VDIsum = sqrt(sum(VDI));

%% Results are stored in 'DistLoadFlowSolution'
DistLoadFlowDGSolution.Vactual=abs(baseKV*Vn);
DistLoadFlowDGSolution.Vangle=Va;
DistLoadFlowDGSolution.VmagPU=Vm;
DistLoadFlowDGSolution.VSI=vsi;
DistLoadFlowDGSolution.VSIsorted=VSIsorted;
DistLoadFlowDGSolution.minVSI=minvsi;

DistLoadFlowDGSolution.VSF=VSF;
DistLoadFlowDGSolution.VSFsum=VSFsum;
DistLoadFlowDGSolution.VDI=VDI;
DistLoadFlowDGSolution.VDIsum=VDIsum;

DistLoadFlowDGSolution.Pbrloss=Pbrloss;
DistLoadFlowDGSolution.Qbrloss=Qbrloss;
DistLoadFlowDGSolution.PtLosskW=PtLosskW;
DistLoadFlowDGSolution.QtLosskVAr=QtLosskVAr;
DistLoadFlowDGSolution.SLosskVA=SLosskVA;
% % plot(DistLoadFlowSolution.VmagPU)
% clearvars -except DistLoadFlowSolution



