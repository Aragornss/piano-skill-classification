%% printRelation函数，绘制两个函数之间的关系曲线
function printRelation2(CurA,CurB)
%% 绘制两个关节转角之间的关系曲线
figure('NumberTitle', 'off', 'Name', '主动触键手指MCP与辅助（小拇指）手指MCP角度观察');
printType(CurA,CurB);% 绘制横轴为X，竖轴为Y二维线图
%title('小拇指MCP和无名指MCP关系')
xlabel('5 MCP/(°)')
ylabel('4 MCP/(°)') 