%% doWaveFil1�����������˲�
function doWaveFil1(angle1,angle2,angle3)
%% �����˲�
%ƽ����ֵ�˲�-Lab10         https://blog.csdn.net/guomutian911/article/details/41576689
figure('NumberTitle', 'off', 'Name', '��ָ�˲����߹۲�');%���ø�����
DL1=length(angle3);

%�˲�����MCP
x_MCP=angle1;
b_MCP=filter2(fspecial('average',10),x_MCP)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
p01=plot(b_MCP(5:DL1-5),'k','LineWidth',1);
hold on;

%�˲�����PIP
x_PIP=angle2;
b_PIP=filter2(fspecial('average',10),x_PIP)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
p02=plot(b_PIP(5:DL1-5),'b','LineWidth',1);
hold on;

%�˲�����DIP
x_DIP=angle3;
b_DIP=filter2(fspecial('average',10),x_DIP)*10;%fspecial()����Ϊ��ֵ�˲����ӣ�filter()�����󻬶�ƽ��
p03=plot(b_DIP(5:DL1-5),'g','LineWidth',1);
hold on;

%%������������Ҳ�������ͼ�Ĳ���  �ο�https://zhidao.baidu.com/question/500519656.html
% set(gcf,'unit','centimeters','position',[23 13 23 14],'PaperPositionMode','auto');
% set(gcf,'ToolBar','none','ReSize','off');   % �̶���С
set(gcf,'color','w');
h1=legend([p01, p02, p03],'MCP','PIP','DIP');
set(h1,'Linewidth',0.5,'FontSize',9);%,'FontWeight','bold');

%�������ͼ���ʽ
% title('\itt\rm(s\rm)','FontSize',14,'FontName','Times New Roman','FontWeight','bold');
g = get(p01,'Parent');%��Ӧp1���ڵ�������
set(g,'Linewidth',0.5,'FontSize',9,'FontName','Times New Roman','FontWeight','bold');
set(g,'GridLineStyle','--','GridColor','k','GridAlpha',0.1);
% axis([0 900 -35 180]);
ylabel('\fontname{����}�Ƕ�\fontname{Times New Roman}(��)','FontSize',9,'FontName','����','FontWeight','bold');
xlabel('\fontname{����}�ɼ�����(��)','FontSize',9,'FontName','����','FontWeight','bold');
grid off;