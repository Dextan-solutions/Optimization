clc;clear
bn = 33;
Standard = true;
Bus_Data = 'Ayepe ';
[VSI, VP, PLR33, VPIR_33, VSI_Ayepe34, VP_Ayepe34, PLR_Ayepe34, VPIR_Ayepe34]=plotdata;
figure(1)
xv=1:length(VSI);
VSIdgANA=VSI(:,2);
VSIdgPSO=VSI(:,3);
VsiBase=VSI(:,1);
plot(xv,VSIdgANA,'g-o',xv,VsiBase,'c-*',xv,VSIdgPSO,'r-*');
xlim([1 bn-1]);
legend('VSI With DG (Analytical)','VSI With No DG (Base Case)','VSI With DG (PSO) )','Location','northeast')
xlabel('Branch Number')
ylabel('Voltage Stability Index')

if Standard
    title(['Voltage Stability Index for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Stability Index for ',Bus_Data, num2str(bn), ' bus'])
    saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(2)
xv=1:length(VP);
VPdgANA=VP(:,2);
VPdgPSO=VP(:,3);
VPBase=VP(:,1);
plot(xv,VPdgANA,'g-o',xv,VPBase,'c-*',xv,VPdgPSO,'r-*');
xlim([1 bn]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Bus Number')
ylabel('Voltage Profile')

if Standard
    title(['Voltage Profile for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Profile for ',Bus_Data, num2str(bn), ' bus'])
    saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(3)
xv=1:length(PLR33);
PLR33dgANA=PLR33(:,3);
PLR33dgPSO=PLR33(:,5);
PLR33Base=PLR33(:,1);
plot(xv,PLR33dgANA,'g-o',xv,PLR33Base,'c-*',xv,PLR33dgPSO,'r-*');
xlim([1 bn-1]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Branch Number')
ylabel('Power/Line Loss (MW)')

if Standard
    title(['Power/Line Loss for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Stability Index for ',Bus_Data, num2str(bn), ' bus'])
    saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(4)
xv=1:length(VPIR_33);
VPIR_33Base=VPIR_33(:,1);
VPIR_33dgANA=VPIR_33(:,2);
VPIR_33dgPSO=VPIR_33(:,3);
plot(xv,VPIR_33dgANA,'g-o',xv,VPIR_33Base,'c-*',xv,VPIR_33dgPSO,'r-*');
xlim([1 bn]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Bus Number')
ylabel('Voltage Profile')

if Standard
    title(['Voltage Profile Improvement Result for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Stability Index for ',Bus_Data, num2str(bn), ' bus'])
    saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

%% Ploting for Ayepe 34 Bus
Standard = false;
bn = 34;
figure(5)
xv=1:length(VSI_Ayepe34);
VSI_Ayepe34Base=VSI_Ayepe34(:,1);
VSI_Ayepe34dgANA=VSI_Ayepe34(:,2);
VSI_Ayepe34dgPSO=VSI_Ayepe34(:,3);
plot(xv,VSI_Ayepe34dgANA,'g-o',xv,VSI_Ayepe34Base,'c-*',xv,VSI_Ayepe34dgPSO,'r-*');
xlim([1 bn-1]);
legend('VSI With DG (Analytical)','VSI With No DG (Base Case)','VSI With DG (PSO) )','Location','northeast')
xlabel('Branch Number')
ylabel('Voltage Stability Index')

if Standard
    title(['Voltage Stability Index for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Stability Index for ',Bus_Data, num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(6)
xv=1:length(VP_Ayepe34);
VP_Ayepe34dgANA=VP_Ayepe34(:,2);
VP_Ayepe34dgPSO=VP_Ayepe34(:,3);
VP_Ayepe34Base=VP_Ayepe34(:,1);
plot(xv,VP_Ayepe34dgANA,'g-o',xv,VP_Ayepe34Base,'c-*',xv,VP_Ayepe34dgPSO,'r-*');
xlim([1 bn]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Bus Number')
ylabel('Voltage Profile')

if Standard
    title(['Voltage Profile for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Profile for ',Bus_Data, num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(7)
xv=1:length(PLR_Ayepe34);
PLR_Ayepe34dgANA=PLR_Ayepe34(:,3);
PLR_Ayepe34dgPSO=PLR_Ayepe34(:,5);
PLR_Ayepe34Base=PLR_Ayepe34(:,1);
plot(xv,PLR_Ayepe34dgANA,'g-o',xv,PLR_Ayepe34Base,'c-*',xv,PLR_Ayepe34dgPSO,'r-*');
xlim([1 bn-1]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Branch Number')
ylabel('Power/Line Loss (MW)')

if Standard
    title(['Power/Line Loss for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Power/Line Loss for ',Bus_Data, num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end

figure(8)
xv=1:length(VPIR_Ayepe34);
VPIR_Ayepe34Base=VPIR_Ayepe34(:,1);
VPIR_Ayepe34dgANA=VPIR_Ayepe34(:,2);
VPIR_Ayepe34dgPSO=VPIR_Ayepe34(:,3);
plot(xv,VPIR_Ayepe34dgANA,'g-o',xv,VPIR_Ayepe34Base,'c-*',xv,VPIR_Ayepe34dgPSO,'r-*');
xlim([1 bn]);
legend('With DG (Analytical)','With No DG (Base Case)','With DG (PSO) )','Location','northeast')
xlabel('Bus Number')
ylabel('Voltage Profile')

if Standard
    title(['Voltage Profile Improvement Result for IEEE standard ', num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_IEEE standard_',num2str(bn),'_bus','.png'])
else
    title(['Voltage Profile Improvement Result for ',Bus_Data, num2str(bn), ' bus'])
%     saveas(gcf,['NewPlot/Voltage_Stability_Index_for_',Bus_Data,num2str(bn),'_bus','.png'])
end
