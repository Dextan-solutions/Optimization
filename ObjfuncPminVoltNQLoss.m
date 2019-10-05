function [ f] = ObjfuncPminVoltNQLoss(TPL,minVTM,Q)

Kp = 0.6;
Kv =0.3;
Kq =0.1;
% 
% DistLoadFlowSolution=powerflow;
% 
% VTM=DistLoadFlowSolution.VmagPU;
% 
% TPL=DistLoadFlowSolution.PtLosskW;

f = Kp*TPL + Kv*(1/minVTM) + Kq*Q;         %TPL = TotalPowerLoss;  VTM=VoltageMag Q=Qloss

end

