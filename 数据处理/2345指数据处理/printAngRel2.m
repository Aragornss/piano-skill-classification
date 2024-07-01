%% printAngRel函数，绘制无名指各关节转角变化曲线和各关节转角之间的关系图像
function printAngRel2(CurA,CurB,CurC)
%绘制无名指指各关节转角变化曲线
figure('NumberTitle', 'off', 'Name', '无名指各关节转角曲线');
hold on;
plot(CurA);
plot(CurB);
plot(CurC);
hold off;
lgd = legend('MCP', 'PIP', 'DIP');
lgd.FontSize = 12;
xlabel('采样点','FontName','宋体','FontSize',12); %设置x轴标签
ylabel('关节转角(°)','FontName','宋体','FontSize',12); %设置y轴标签
set(gca,'FontName','宋体','FontSize',12);  % 设置当前坐标轴的字体为宋体，字体大小为12
%ylim([-400,400]);                         % 限制坐标轴范围
%set(gcf,'Position',[600,600,600,200]);    % 设置图像位置

%% 绘制各关节转角之间的关系曲线
figure('NumberTitle', 'off', 'Name', '无名指各关节转角之间的关系');
subplot(2,2,1);
printType(CurA,CurB);
%axis([55,110, 10,70])
%title('MCP与PIP夹角关系')
xlabel('MCP/(°)')
ylabel('PIP/(°)') 
subplot(2,2,2);
printType(CurA,CurC);
%axis([55,110, 10,70])
%title('MCP与DIP夹角关系')
xlabel('MCP/(°)')
ylabel('DIP/(°)') 
subplot(2,2,3);
printType(CurB,CurC);
%axis([10,70, 10,70])
%title('PIP与DIP夹角关系')
xlabel('PIP/(°)')
ylabel('DIP/(°)') 