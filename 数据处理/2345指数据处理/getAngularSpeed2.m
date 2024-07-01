%% 获取无名指各关节转角的角速度
function [rin_angularSpeed_MCP,rin_angularSpeed_PIP,rin_angularSpeed_DIP]=getAngularSpeed2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,p)
%获取无名指MCP关节转角的角速度
speed = [];
a = rin_angle_MCP;
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
rin_angularSpeed_MCP = speed;

%获取无名指PIP关节转角的角速度
speed = [];
a = rin_angle_PIP;
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
rin_angularSpeed_PIP = speed;

%获取无名指DIP关节转角的角速度
speed = [];
a = rin_angle_DIP;
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
rin_angularSpeed_DIP = speed;

