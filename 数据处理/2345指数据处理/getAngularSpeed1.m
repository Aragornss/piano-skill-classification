%% 获取中指各关节转角的角速度
function [mid_angularSpeed_MCP,mid_angularSpeed_PIP,mid_angularSpeed_DIP]=getAngularSpeed1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,p)
%获取中指MCP关节转角的角速度
speed = [];
a = mid_angle_MCP;
for i = 1:p-1
    speed = [speed,(a(i+1)-a(i))./(1./60)];
end
figure
plot(speed);
% hold on
% plot(a);
figure
b=filter2(fspecial('average',10),speed)*10;
plot(b,'k','LineWidth',1);
% hold on
% plot(a);
mid_angularSpeed_MCP = speed;

%获取中指PIP关节转角的角速度
speed = [];
a = mid_angle_PIP;
for i = 1:p-1
    speed = [speed,(a(i+1)-a(i))./(1./60)];
end
figure
plot(speed);
% hold on
% plot(a);
figure
b=filter2(fspecial('average',10),speed)*10;
plot(b,'k','LineWidth',1);
% hold on
% plot(a);
mid_angularSpeed_PIP = speed;

%获取中指DIP关节转角的角速度
speed = [];
a = mid_angle_DIP;
for i = 1:p-1
    speed = [speed,(a(i+1)-a(i))./(1./60)];
end
figure
plot(speed);
% hold on
% plot(a);
figure
b=filter2(fspecial('average',10),speed)*10;
plot(b,'k','LineWidth',1);
% hold on
% plot(a);
mid_angularSpeed_DIP = speed;

