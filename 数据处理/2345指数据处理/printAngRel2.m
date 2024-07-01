%% printAngRel��������������ָ���ؽ�ת�Ǳ仯���ߺ͸��ؽ�ת��֮��Ĺ�ϵͼ��
function printAngRel2(CurA,CurB,CurC)
%��������ָָ���ؽ�ת�Ǳ仯����
figure('NumberTitle', 'off', 'Name', '����ָ���ؽ�ת������');
hold on;
plot(CurA);
plot(CurB);
plot(CurC);
hold off;
lgd = legend('MCP', 'PIP', 'DIP');
lgd.FontSize = 12;
xlabel('������','FontName','����','FontSize',12); %����x���ǩ
ylabel('�ؽ�ת��(��)','FontName','����','FontSize',12); %����y���ǩ
set(gca,'FontName','����','FontSize',12);  % ���õ�ǰ�����������Ϊ���壬�����СΪ12
%ylim([-400,400]);                         % ���������᷶Χ
%set(gcf,'Position',[600,600,600,200]);    % ����ͼ��λ��

%% ���Ƹ��ؽ�ת��֮��Ĺ�ϵ����
figure('NumberTitle', 'off', 'Name', '����ָ���ؽ�ת��֮��Ĺ�ϵ');
subplot(2,2,1);
printType(CurA,CurB);
%axis([55,110, 10,70])
%title('MCP��PIP�нǹ�ϵ')
xlabel('MCP/(��)')
ylabel('PIP/(��)') 
subplot(2,2,2);
printType(CurA,CurC);
%axis([55,110, 10,70])
%title('MCP��DIP�нǹ�ϵ')
xlabel('MCP/(��)')
ylabel('DIP/(��)') 
subplot(2,2,3);
printType(CurB,CurC);
%axis([10,70, 10,70])
%title('PIP��DIP�нǹ�ϵ')
xlabel('PIP/(��)')
ylabel('DIP/(��)') 