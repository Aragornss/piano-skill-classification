% 测量数据分析  
clear;clc;%close all;

% 输出读入的数据A，并输出数据长度p
[A,p]=readFile();

%获取大拇指特征点原始坐标数据(分别为：CMC、MCP、IP、TIP)、中指特征点原始坐标数据(分别为：MCP、PIP)
[P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP]=getOC(A);

%获取原始坐标系下各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
[L_mid,L_CMC_MCP,L_MCP_IP,L_IP_TIP,L]=getLengthOC(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p);

%计算坐标系{1}中大拇指和中指特征点坐标
[P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP]=getPosition1(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p);

%获取坐标系{1}中各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
[L1_mid,L1_CMC_MCP,L1_MCP_IP,L1_IP_TIP,L1_Thumb]=getLength1(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,p);

%获取坐标系{1}中手指各关节转角(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP),拇指平面法向量F，中指倾斜角c及拇指平面验证角angle
[angle,c,angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,F]=getAngles(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,L_mid,p);

%构建动坐标系{2}，获得拇指绕掌骨节旋转角度
angle_F=getPosition2(P0_CMC,P0_MCP,P0_IP,P0_TIP,p);

%数据滤波观察，输出滤波******图像******
doWaveFil(angle_r_CMC_MCP_YZ,angle_r_CMC_MCP_XY,angle_MCP,angle_IP,angle_F,c);
