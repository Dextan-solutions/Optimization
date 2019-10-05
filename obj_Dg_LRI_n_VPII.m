function [fx] = obj_Dg_LRI_n_VPII(TPL_base,TPL_Dg,TQL_base,TQL_Dg,VSFsum,VDIsum)
% This function takes in Total Power Loss for Base case without DG,
% Total Power Loss (PtLosskW) for the case with DG, Total Reactive Power Loss(QtLoss) for Base case without DG
% Total Reactive Power Loss(QtLoss) for Base case with DG, and the Voltage
% Magnitude(VmagPU)

%% Calculating Loss Reduction Index (LRI)
RPLRI = (TPL_base - TPL_Dg)/TPL_base;
QLRI = (TQL_base - TQL_Dg)/TQL_base;

LRI = RPLRI + QLRI;

%% Calculating Voltage Profile Improvement Index
VPII=VSFsum + VDIsum;

%% The Objective function
fx = -(0.8*LRI + 0.2*VPII);
