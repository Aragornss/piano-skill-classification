%% doWaveFil�����������˲�
function doWaveFil(angle1,angle2,angle3,angle4,angle5,angle6)
%% �����˲�
%ƽ����ֵ�˲�-Lab10         https://blog.csdn.net/guomutian911/article/details/41576689
figure('NumberTitle', 'off', 'Name', '�˲����߹۲�');%���ø�����
DL1=length(angle6);
%�˲�����angle_r_CMC_MCP_YZ
x_YZ=angle1;
b_YZ=filter2(fspecial('average',10),x_YZ)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
p01=plot(b_YZ(5:DL1-5),'k','LineWidth',1);
hold on;
%�˲�����angle_r_CMC_MCP_XY
x_XY=angle2;
b_XY=filter2(fspecial('average',10),x_XY)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
plot(b_XY(5:DL1-5),'b','LineWidth',1);
hold on;
%�˲�����angle_MCP
x_MCP=angle3;
b_MCP=filter2(fspecial('average',10),x_MCP)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
plot(b_MCP(5:DL1-5),'g','LineWidth',1);
hold on;
%�˲�����angle_IP
x_IP=angle4;
b_IP=filter2(fspecial('average',10),x_IP)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
plot(b_IP(5:DL1-5),'c','LineWidth',1);
hold on
%�˲�����angle_F
x_F=angle5;
b_F=filter2(fspecial('average',10),x_F)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
plot(b_F(5:DL1-5),'m','LineWidth',1);
hold on;
%�˲�����angle_c
x_c=angle6;
b_c=filter2(fspecial('average',10),x_c)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
plot(b_c(5:DL1-5),'r','LineWidth',1);

%�������ͼ���ʽ
% set(gcf,'unit','centimeters','position',[23 13 23 14],'PaperPositionMode','auto');
% set(gcf,'ToolBar','none','ReSize','off');   % �̶���С
set(gcf,'color','w');
h1=legend('\fontname{Times New Roman}\beta','\fontname{Times New Roman}\alpha','\fontname{Times New Roman}\psi','\fontname{Times New Roman}\phi','\fontname{Times New Roman}\gamma','\fontname{Times New Roman}\theta');
set(h1,'Linewidth',0.5,'FontSize',10.5);%,'FontWeight','bold');
% title('\itt\rm(s\rm)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
g = get(p01,'Parent');%��Ӧp1���ڵ�������
set(g,'Linewidth',0.1,'FontSize',10.5,'FontName','Times New Roman');%,'FontWeight','bold'
set(g,'GridLineStyle','--','GridColor','k','GridAlpha',0.1);
% axis([0 900 -35 180]);
% ylabel('\fontname{����}�Ƕ�\fontname{Times New Roman}(deg)','FontSize',10.5,'FontName','����');%,'FontWeight','bold'
% xlabel('\fontname{����}�ɼ�����(��)','FontSize',10.5,'FontName','Times New Roman');%,'FontWeight','bold'
grid off;