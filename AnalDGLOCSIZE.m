function AnalDGLOCSIZE
% (linedata,busdata,Vs)
case33radial
%START/BEGIN
%this program uses the line and bus data of a distribution network to search for the optimal DG location and size via the analytical method%
tic;

linedata=sortc(linedata,3);% sort the linedata in ascending order of buses
busdata=sortc(busdata,1);% sort the busdata in ascending order of buses
busdata(:,1)=linedata(:,3);
[PLOSS S_source S_Demand S_injected Vi]=RADFLOW(linedata,busdata,Vs);
Viiii=Vi;
%To estimate the base case Total active power loss
N=length(Vi); %obtain the number of load buses
Ploss=0; %initialize the total network active power loss
for i=1:N
%determine rij
rij=linedata(i,4);% get the value of branch resistance
for j=1:N
if linedata(i,2)==0
vi=abs(Vs);
zigmai=angle(Vs);
Pi=real(S_source);
Qi=-imag(S_source);
else
if linedata(i,2)~=0
if busdata(j,1)==linedata(i,2)
vi=abs(Vi(j,1));
zigmai=angle(Vi(j,1));
Pi=real(S_injected(j,1));
Qi=-imag(S_injected(j,1));
end
end
end
end
%determine beta
for j=1:N
if busdata(j,1)==linedata(i,3)
vj=abs(Vi(j,1));
zigmaj=angle(Vi(j,1));
Pj=real(S_injected(j,1));
Qj=-imag(S_injected(j,1));
end
end
P_i(i,1)=(Pi);
P_j(i,1)=(Pj);
Q_i(i,1)=(Qi);
Q_j(i,1)=(Qj);
alpha_ij=rij*cos(zigmai-zigmaj)/(vi*vj);
beta_ij=rij*sin(zigmai-zigmaj)/(vi*vj);
Plossij=alpha_ij*((Pi*Pj)+(Qi*Qj))+beta_ij*((Qi*Pj)-(Pi*Qj));
Ploss=Ploss+Plossij;
alphaij(i,1)=alpha_ij;
betaij(i,1)=beta_ij;
end

PLoss=Ploss;
%Calculation of DG power factor
for h=1:length(S_Demand)
if S_Demand(h,1)~=0
PF_DG(h,1)=real(S_Demand(h,1))./((real(S_Demand(h,1))).^2+(imag(S_Demand(h,1))).^2).^0.5;
else
PF_DG(h,1)=0;
end
end
%Finding the optimal size of DG
for h=1:length(S_Demand)
if PF_DG(h,1)~=0
A(h,1)=sign(tan(acos(PF_DG(h,1)))).*(tan(acos(PF_DG(h,1))));
else
A(h,1)=0;
end
end
%constructing the X and Y matrixes with elements Xi and Yi respectively
Xi=[];
Yi=[];
for i=1:N
X=sum(alphaij.*P_j-betaij.*Q_j)-alphaij(i).*P_j(i)+betaij(i).*Q_j(i);
Y=sum(alphaij.*Q_j+betaij.*P_j)-alphaij(i).*Q_j(i)-betaij(i).*P_j(i);
Xi=[Xi;X];
Yi=[Yi;Y];
end
%Finding the Optimum Size of DG i.e P_DGis and Q_DGis
for h=1:length(S_Demand)
P_DG(h,1)=(alphaij(h,1)*(real(S_Demand(h,1))+A(h,1)*(imag(S_Demand(h,1))))...
+betaij(h,1)*(A(h,1)*(real(S_Demand(h,1)))-(imag(S_Demand(h,1))))...
-Xi(h,1)-A(h,1)*Yi(h,1))/ceil(A(h,1)*(alphaij(h,1))+alphaij(h,1)+N);
Q_DG(h,1)=(A(h,1))*P_DG(h,1);
end
P_loss_with_DG=[];
iter=0;
for bus=1:N
S_DG=zeros(size(S_Demand));
iter=iter+1;
S_DG(bus)=P_DG(bus)-1i*Q_DG(bus);
S_D=(S_Demand)-S_DG;
new_busdata=busdata;
new_busdata(:,2:3)=[(conj(S_D)),cos(angle(conj(S_D)))];
[P_LOSS, S_source ~, S_Injected ~,]=RADFLOW(linedata,new_busdata,Vs);
%initialize the total network active power loss
clc
d=sprintf('PLACING DG AT LOCATION %d OF THE NETWORK WHILE SEARCHING\nFOR THE OPTIMUM DG LOCATION USING ANALYTICAL METHOD',iter);
disp(d)
P_i=[];
P_j=[];
Q_i=[];
Q_j=[];
for i=1:N
for j=1:N
if linedata(i,2)==0
Pi=real(S_source);
Qi=-imag(S_source);
else
    if linedata(i,2)~=0
if busdata(j,1)==linedata(i,2)
Pi=real(S_Injected(j,1));
Qi=-imag(S_Injected(j,1));
end
end
end
end
%determine beta
for j=1:N
if busdata(j,1)==linedata(i,3)
Pj=real(S_Injected(j,1));
Qj=-imag(S_Injected(j,1));
end
end
P_i(i,1)=(Pi);
P_j(i,1)=(Pj);
Q_i(i,1)=(Qi);
Q_j(i,1)=(Qj);
end
P_lossij=sum(alphaij.*(P_i.*P_j+Q_i.*Q_j)+betaij.*(Q_i.*P_j-P_i.*Q_j));
P_loss_with_DG=[P_loss_with_DG;P_LOSS];
end
for bus=1:N
if P_loss_with_DG(bus)==min(P_loss_with_DG)
Min_P_loss_with_DG=P_loss_with_DG(bus);
end
end
for bus=1:N
if P_loss_with_DG(bus)==min(P_loss_with_DG)
Best_Location=busdata(bus,1);
best=bus;
end
end
for bus=1:N
if P_loss_with_DG(bus)==min(P_loss_with_DG)
Optimal_DG_Size=P_DG(bus)+1i*Q_DG(bus);
end
end
bus= best;
S_DG=zeros(size(S_Demand));
iter=iter+1;
S_DG(bus)=P_DG(bus)-1i*Q_DG(bus);
S_D=(S_Demand)-(S_DG);
new_busdata=busdata;
new_busdata(:,2:3)=[((S_D)),cos(angle((S_D)))];
clc
d=sprintf('PLACING DG AT THE OPTIMUM LOCATION OF THE NETWORK WHILE SEARCHING\nFOR THE OPTIMUM DG LOCATION USING ANALYTICAL METHOD');
disp(d)
[PLOSS_BEST S_Source ~, S_InjecteD, Viii]=RADFLOW(linedata,new_busdata,Vs);
%initialize the total network active power loss
Plosses=0; %initialize the total network active power loss
for i=1:N
rij=linedata(i,4);% get the value of branch resistance
for j=1:N
if linedata(i,2)==0
vi=abs(Vs);
zigmai=angle(Vs);
Pi=real(S_Source);
Qi=-imag(S_Source);
else
if linedata(i,2)~=0
if busdata(j,1)==linedata(i,2)
vi=abs(Viii(j,1));
zigmai=angle(Viii(j,1));
Pi=real(S_InjecteD(j,1));
Qi=-imag(S_InjecteD(j,1));
end
end
end
end
%determine beta
for j=1:N
if busdata(j,1)==linedata(i,3)
vj=abs(Viii(j,1));%
zigmaj=angle(Viii(j,1));
Pj=real(S_InjecteD(j,1));
Qj=-imag(S_InjecteD(j,1));
end
end
alpha_ij=rij*cos(zigmai-zigmaj)/(vi*vj);
beta_ij=rij*sin(zigmai-zigmaj)/(vi*vj);
Plossesij=alpha_ij*((Pi*Pj)+(Qi*Qj))+beta_ij*((Qi*Pj)-(Pi*Qj));
Plosses=Plosses+Plossesij;
Alphaij(i,1)=alpha_ij;
Betaij(i,1)=beta_ij;
end
clc
Alpha=Alphaij;
Beta=Betaij;
Location=Best_Location;
Size=round(abs(Optimal_DG_Size)*100000);
info=sprintf('THE OPTIMUM LOCATION OF DG IS AT BUS: %d AND IT HAS A SIZE OF %dE-5 pu ',Location,Size);
disp(info);
Sinj=S_injected;
P_Loss_best=round(real(PLOSS_BEST)*100000);
P_loss_base_case=round(real(PLOSS)*100000);
info1=sprintf('THE TOTAL REAL POWER LOSS OF THE NETWORK WITH, AND WITHOUT DG ARE: %dE-5 AND %dE-5 RESPECTIVELY ',P_Loss_best,P_loss_base_case);
disp(info1);
V_with_DG=abs(Viii)
V_base_case=abs(Viiii)
Q=1:length(Vi);
plot(Q,(abs(V_base_case)),Q,(abs(V_with_DG)))
V4 = Viiii
V5= Viii
legend('Base Case','Optimum')
title('VOLTAGE PROFILE')
xlabel('Bus Number');
ylabel('Voltage Magnitude (per unit)');
toc