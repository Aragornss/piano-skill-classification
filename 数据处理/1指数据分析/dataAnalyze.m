% �������ݷ���  
clear;clc;%close all;

% ������������A����������ݳ���p
[A,p]=readFile();

%��ȡ��Ĵָ������ԭʼ��������(�ֱ�Ϊ��CMC��MCP��IP��TIP)����ָ������ԭʼ��������(�ֱ�Ϊ��MCP��PIP)
[P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP]=getOC(A);

%��ȡԭʼ����ϵ�¸�ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ�Ĵָ�ƹǽڡ�Ĵָ��ָ�ڡ�ĴָԶָ�ڡ�Ĵָ�ܳ�)
[L_mid,L_CMC_MCP,L_MCP_IP,L_IP_TIP,L]=getLengthOC(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p);

%��������ϵ{1}�д�Ĵָ����ָ����������
[P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP]=getPosition1(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p);

%��ȡ����ϵ{1}�и�ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ�Ĵָ�ƹǽڡ�Ĵָ��ָ�ڡ�ĴָԶָ�ڡ�Ĵָ�ܳ�)
[L1_mid,L1_CMC_MCP,L1_MCP_IP,L1_IP_TIP,L1_Thumb]=getLength1(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,p);

%��ȡ����ϵ{1}����ָ���ؽ�ת��(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP),Ĵָƽ�淨����F����ָ��б��c��Ĵָƽ����֤��angle
[angle,c,angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,F]=getAngles(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,L_mid,p);

%����������ϵ{2}�����Ĵָ���ƹǽ���ת�Ƕ�
angle_F=getPosition2(P0_CMC,P0_MCP,P0_IP,P0_TIP,p);

%�����˲��۲죬����˲�******ͼ��******
doWaveFil(angle_r_CMC_MCP_YZ,angle_r_CMC_MCP_XY,angle_MCP,angle_IP,angle_F,c);
