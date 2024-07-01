%% doWaveFil函数，数据滤波
function doWaveFil(angle1,angle2,angle3,angle4,angle5,angle6)
%% 数据滤波
%平滑均值滤波-Lab10         https://blog.csdn.net/guomutian911/article/details/41576689
figure('NumberTitle', 'off', 'Name', '滤波曲线观察');%更好更有用
DL1=length(angle6);
%滤波——angle_r_CMC_MCP_YZ
x_YZ=angle1;
b_YZ=filter2(fspecial('average',10),x_YZ)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
p01=plot(b_YZ(5:DL1-5),'k','LineWidth',1);
hold on;
%滤波——angle_r_CMC_MCP_XY
x_XY=angle2;
b_XY=filter2(fspecial('average',10),x_XY)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
plot(b_XY(5:DL1-5),'b','LineWidth',1);
hold on;
%滤波——angle_MCP
x_MCP=angle3;
b_MCP=filter2(fspecial('average',10),x_MCP)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
plot(b_MCP(5:DL1-5),'g','LineWidth',1);
hold on;
%滤波——angle_IP
x_IP=angle4;
b_IP=filter2(fspecial('average',10),x_IP)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
plot(b_IP(5:DL1-5),'c','LineWidth',1);
hold on
%滤波——angle_F
x_F=angle5;
b_F=filter2(fspecial('average',10),x_F)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
plot(b_F(5:DL1-5),'m','LineWidth',1);
hold on;
%滤波——angle_c
x_c=angle6;
b_c=filter2(fspecial('average',10),x_c)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
plot(b_c(5:DL1-5),'r','LineWidth',1);

%设置输出图像格式
% set(gcf,'unit','centimeters','position',[23 13 23 14],'PaperPositionMode','auto');
% set(gcf,'ToolBar','none','ReSize','off');   % 固定大小
set(gcf,'color','w');
h1=legend('\fontname{Times New Roman}\beta','\fontname{Times New Roman}\alpha','\fontname{Times New Roman}\psi','\fontname{Times New Roman}\phi','\fontname{Times New Roman}\gamma','\fontname{Times New Roman}\theta');
set(h1,'Linewidth',0.5,'FontSize',10.5);%,'FontWeight','bold');
% title('\itt\rm(s\rm)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
g = get(p01,'Parent');%对应p1所在的坐标轴
set(g,'Linewidth',0.1,'FontSize',10.5,'FontName','Times New Roman');%,'FontWeight','bold'
set(g,'GridLineStyle','--','GridColor','k','GridAlpha',0.1);
% axis([0 900 -35 180]);
% ylabel('\fontname{宋体}角度\fontname{Times New Roman}(deg)','FontSize',10.5,'FontName','宋体');%,'FontWeight','bold'
% xlabel('\fontname{宋体}采集次数(次)','FontSize',10.5,'FontName','Times New Roman');%,'FontWeight','bold'
grid off;