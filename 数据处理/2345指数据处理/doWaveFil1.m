%% doWaveFil1函数，数据滤波
function doWaveFil1(angle1,angle2,angle3)
%% 数据滤波
%平滑均值滤波-Lab10         https://blog.csdn.net/guomutian911/article/details/41576689
figure('NumberTitle', 'off', 'Name', '中指滤波曲线观察');%更好更有用
DL1=length(angle3);

%滤波——MCP
x_MCP=angle1;
b_MCP=filter2(fspecial('average',10),x_MCP)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
p01=plot(b_MCP(5:DL1-5),'k','LineWidth',1);
hold on;

%滤波——PIP
x_PIP=angle2;
b_PIP=filter2(fspecial('average',10),x_PIP)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
p02=plot(b_PIP(5:DL1-5),'b','LineWidth',1);
hold on;

%滤波——DIP
x_DIP=angle3;
b_DIP=filter2(fspecial('average',10),x_DIP)*10;%fspecial()函数为均值滤波算子；filter()函数求滑动平均
p03=plot(b_DIP(5:DL1-5),'g','LineWidth',1);
hold on;

%%下面这块作用我猜是设置图的参数  参考https://zhidao.baidu.com/question/500519656.html
% set(gcf,'unit','centimeters','position',[23 13 23 14],'PaperPositionMode','auto');
% set(gcf,'ToolBar','none','ReSize','off');   % 固定大小
set(gcf,'color','w');
h1=legend([p01, p02, p03],'MCP','PIP','DIP');
set(h1,'Linewidth',0.5,'FontSize',9);%,'FontWeight','bold');

%设置输出图像格式
% title('\itt\rm(s\rm)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
g = get(p01,'Parent');%对应p1所在的坐标轴
set(g,'Linewidth',0.5,'FontSize',9,'FontName','Times New Roman','FontWeight','bold');
set(g,'GridLineStyle','--','GridColor','k','GridAlpha',0.1);
% axis([0 900 -35 180]);
ylabel('\fontname{宋体}角度\fontname{Times New Roman}(°)','FontSize',9,'FontName','宋体','FontWeight','bold');
xlabel('\fontname{宋体}采集次数(次)','FontSize',9,'FontName','宋体','FontWeight','bold');
grid off;