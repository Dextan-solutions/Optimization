clc;clear
load 'AnalDGWorkSpace_Ayepe 34_bus'
Branch_No=xv';
Bus_No=(1:bn)';
Bus_DataS='IEEE_Standard_';
Bus_DataN='Ayepe_';
%% VSI Result
VSI_before_DG_Placement=DistLoadFlowSolution.VSI;
VSI_After_DG_Placement=BestProfile.VSI;
T1=table(Branch_No,VSI_before_DG_Placement,VSI_After_DG_Placement);
filename = ['AnalyticalReport/AnalyReport_DG_',Bus_DataN,num2str(bn),'_Bus.xlsx'];
writetable(T1,filename,'Sheet',1,'Range','D1')

%% Voltage Profile Result
Voltage_Profile_before_DG_Placement=DistLoadFlowSolution.VmagPU;
Voltage_Profile_After_DG_Placement=BestProfile.VmagPU;
T2=table(Bus_No,Voltage_Profile_before_DG_Placement,Voltage_Profile_After_DG_Placement);
writetable(T2,filename,'Sheet',2,'Range','D1')

%% Power Loss
Power_Loss_before_DG_Placement=DistLoadFlowSolution.Pbrloss;
Power_Loss_After_DG_Placement=BestProfile.Pbrloss;
T3=table(Branch_No,Power_Loss_before_DG_Placement,Power_Loss_After_DG_Placement);
writetable(T3,filename,'Sheet',3,'Range','D1')

%% Reactive Power Loss(Qr)
Reactive_Power_Loss_before_DG_Placement=DistLoadFlowSolution.Qbrloss;
Reactive_Power_Loss_After_DG_Placement=BestProfile.Qbrloss;
T4=table(Branch_No,Reactive_Power_Loss_before_DG_Placement,Reactive_Power_Loss_After_DG_Placement);
writetable(T4,filename,'Sheet',4,'Range','D1')

%% S Loss(Qr)
S_Loss_before_DG_Placement=DistLoadFlowSolution.SLosskVA;
S_Loss_After_DG_Placement=BestProfile.SLosskVA;
T5=table(S_Loss_before_DG_Placement,S_Loss_After_DG_Placement);
writetable(T5,filename,'Sheet',5,'Range','D1')

%% Voltage Angle Result
Voltage_Angle_before_DG_Placement=DistLoadFlowSolution.Vangle;
Voltage_Angle_After_DG_Placement=BestProfile.Vangle;
T6=table(Bus_No,Voltage_Angle_before_DG_Placement,Voltage_Angle_After_DG_Placement);
writetable(T6,filename,'Sheet',6,'Range','D1')

%% Actual Voltage Result
Actual_Voltage_before_DG_Placement=DistLoadFlowSolution.Vactual;
Actual_Voltage_After_DG_Placement=BestProfile.Vactual;
T7=table(Bus_No,Actual_Voltage_before_DG_Placement,Actual_Voltage_After_DG_Placement);
writetable(T7,filename,'Sheet',7,'Range','D1')

%% VSF Result
VSF_before_DG_Placement=DistLoadFlowSolution.VSF;
VSF_After_DG_Placement=BestProfile.VSF;
T8=table(Branch_No,VSF_before_DG_Placement,VSF_After_DG_Placement);
writetable(T8,filename,'Sheet',8,'Range','D1')

%% VDI Result
VDI_before_DG_Placement=DistLoadFlowSolution.VDI;
VDI_After_DG_Placement=BestProfile.VDI;
T9=table(Bus_No,VDI_before_DG_Placement,VDI_After_DG_Placement);
writetable(T9,filename,'Sheet',9,'Range','D1')