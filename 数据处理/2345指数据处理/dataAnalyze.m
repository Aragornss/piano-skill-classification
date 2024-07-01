% 测量数据分析 输出2、3、4、5指各关节转角数据,坐标系{1}原点是MCP,坐标系{2}原点是"CMC"
clear;clc;close all;

% 输出读入的数据A，并输出数据长度p
[A,p]=readFile();

% 获取原始坐标系（leapmotion坐标系）下2、3、4、5指特征点的坐标（分别为："CMC"、MCP、PIP、DIP、TIP）
[P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP]=getOC(A);

% 获取原始坐标系（leapmotion坐标系）下2、3、4、5指各个指节的长度
[L_ind_MCP_PIP,L_ind_PIP_DIP,L_ind_DIP_TIP,L_ind,L_mid_MCP_PIP,L_mid_PIP_DIP,L_mid_DIP_TIP,L_mid,L_rin_MCP_PIP,L_rin_PIP_DIP,L_rin_DIP_TIP,L_rin,L_lit_MCP_PIP,L_lit_PIP_DIP,L_lit_DIP_TIP,L_lit]=getLengthOC(P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p);

% 获取计算坐标系{1}（手指坐标系）下2、3、4、5指特征点的坐标（分别为："CMC"、MCP、PIP、DIP、TIP）
[ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP]=getPosition(P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p);

% 获取计算坐标系{1}（手指坐标系）下2、3、4、5指各个指节的长度
[L1_ind_MCP_PIP,L1_ind_PIP_DIP,L1_ind_DIP_TIP,L1_ind,L1_mid_MCP_PIP,L1_mid_PIP_DIP,L1_mid_DIP_TIP,L1_mid,L1_rin_MCP_PIP,L1_rin_PIP_DIP,L1_rin_DIP_TIP,L1_rin,L1_lit_MCP_PIP,L1_lit_PIP_DIP,L1_lit_DIP_TIP,L1_lit]=getLength(ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p);

% 获取坐标系{1}中2、3、4、5指各关节转角，并保存数据  
[ind_angle_CMC,ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,mid_angle_CMC,mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,rin_angle_CMC,rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,lit_angle_CMC,lit_angle_MCP,lit_angle_PIP,lit_angle_DIP]=getAngles(ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p);
save('angle_data.mat','ind_angle_CMC','ind_angle_MCP','ind_angle_PIP','ind_angle_DIP','mid_angle_CMC','mid_angle_MCP','mid_angle_PIP','mid_angle_DIP','rin_angle_CMC','rin_angle_MCP','rin_angle_PIP','rin_angle_DIP','lit_angle_CMC','lit_angle_MCP','lit_angle_PIP','lit_angle_DIP');  %保存数据

% 绘制2、3、4、5指各关节转角变化曲线和各关节转角之间的关系图像
printAngRel0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,ind_angle_CMC);%食指单独触键的情况
% printAngRel1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP);%中指单独触键的情况
% printAngRel2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP);%无名指在中指和小拇指辅助下触键情况
% printRelation1(mid_angle_MCP,rin_angle_MCP);            %中指MCP和无名指MCP关系
% printRelation2(lit_angle_MCP,rin_angle_MCP);            %小拇指MCP和无名指MCP关系
% printAngRel3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP);%小拇指单独触键的情况

% 绘制2、3、4、5指各关节转角变化曲线滤波后图像
doWaveFil0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,ind_angle_CMC);%滤波后食指单独触键的情况
% doWaveFil1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP);%滤波后中指单独触键的情况
% doWaveFil2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP);%滤波后无名指在中指和小拇指辅助下触键情况
% doWaveFil3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP);%滤波后小拇指单独触键的情况
% doWaveFil(rin_angle_MCP, mid_angle_MCP);              %把两个曲线放一起

% 获取坐标系{1}下2、3、4、5指各关节角速度，并绘制滤波前后图像
[ind_angularSpeed_MCP,ind_angularSpeed_PIP,ind_angularSpeed_DIP]=getAngularSpeed0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,p);% 获取坐标系{1}下食指各关节角速度
% [mid_angularSpeed_MCP,mid_angularSpeed_PIP,mid_angularSpeed_DIP]=getAngularSpeed1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,p);% 获取坐标系{1}下中指各关节角速度
% [rin_angularSpeed_MCP,rin_angularSpeed_PIP,rin_angularSpeed_DIP]=getAngularSpeed2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,p);% 获取坐标系{1}下无名指各关节角速度
% [lit_angularSpeed_MCP,lit_angularSpeed_PIP,lit_angularSpeed_DIP]=getAngularSpeed3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP,p);% 获取坐标系{1}下小拇指各关节角速度

% 提取动作角度最大值



