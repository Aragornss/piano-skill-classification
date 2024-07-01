%% printType函数，设定输出图像类型
function printType(x,y)
%% 设定输出图像类型
t=polyfit(x,y,1);                   % 使用polyfit函数拟合一条直线，返回拟合系数
y_pred = polyval(t, x);             % 使用拟合参数计算预测值
rss = sum((y - y_pred).^2);         % 计算残差平方和（RSS）
tss = sum((y - mean(y)).^2);        % 计算总平方和（TSS）
r_squared = 1 - (rss / tss);        % 计算R方
disp(['R方：', num2str(r_squared)]);% 显示R方
plot(x,y,'b.');                     %绘制散点图，蓝色圆点表示数据点
hold on
plot(x,y_pred,'r','LineWidth',1);   %绘制拟合直线，红色实线表示拟合结果,线条的宽度为1
set(gcf,'color','w');               %设置当前图形窗口的背景颜色为白色
set(gca,'FontName','Times New Roman','FontSize',12);%设置当前坐标轴的字体为Times New Roman，字体大小为12