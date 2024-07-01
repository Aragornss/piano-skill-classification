%% 获取食指各关节转角的角速度
function [ind_angularSpeed_MCP,ind_angularSpeed_PIP,ind_angularSpeed_DIP]=getAngularSpeed0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,p)
%获取食指MCP关节转角的角速度
speed = [];
a = ind_angle_MCP;
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
ind_angularSpeed_MCP = speed;

%获取食指PIP关节转角的角速度
speed = [];
a = ind_angle_PIP;
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
ind_angularSpeed_PIP = speed;

%获取食指DIP关节转角的角速度
speed = [];
a = ind_angle_DIP;
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
ind_angularSpeed_DIP = speed;

