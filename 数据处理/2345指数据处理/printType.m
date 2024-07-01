%% printType�������趨���ͼ������
function printType(x,y)
%% �趨���ͼ������
t=polyfit(x,y,1);                   % ʹ��polyfit�������һ��ֱ�ߣ��������ϵ��
y_pred = polyval(t, x);             % ʹ����ϲ�������Ԥ��ֵ
rss = sum((y - y_pred).^2);         % ����в�ƽ���ͣ�RSS��
tss = sum((y - mean(y)).^2);        % ������ƽ���ͣ�TSS��
r_squared = 1 - (rss / tss);        % ����R��
disp(['R����', num2str(r_squared)]);% ��ʾR��
plot(x,y,'b.');                     %����ɢ��ͼ����ɫԲ���ʾ���ݵ�
hold on
plot(x,y_pred,'r','LineWidth',1);   %�������ֱ�ߣ���ɫʵ�߱�ʾ��Ͻ��,�����Ŀ��Ϊ1
set(gcf,'color','w');               %���õ�ǰͼ�δ��ڵı�����ɫΪ��ɫ
set(gca,'FontName','Times New Roman','FontSize',12);%���õ�ǰ�����������ΪTimes New Roman�������СΪ12