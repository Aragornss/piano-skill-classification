%% 获取小拇指各关节转角的角速度
function [lit_angularSpeed_MCP,lit_angularSpeed_PIP,lit_angularSpeed_DIP]=getAngularSpeed3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP,p)
%获取小拇指MCP关节转角的角速度
speed = [];
a = lit_angle_MCP;
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
lit_angularSpeed_MCP = speed;

%获取小拇指PIP关节转角的角速度
speed = [];
a = lit_angle_PIP;
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
lit_angularSpeed_PIP = speed;

%获取小拇指DIP关节转角的角速度
speed = [];
a = lit_angle_DIP;
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
lit_angularSpeed_DIP = speed;

