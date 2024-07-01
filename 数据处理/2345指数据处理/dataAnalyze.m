% �������ݷ��� ���2��3��4��5ָ���ؽ�ת������,����ϵ{1}ԭ����MCP,����ϵ{2}ԭ����"CMC"
clear;clc;close all;

% ������������A����������ݳ���p
[A,p]=readFile();

% ��ȡԭʼ����ϵ��leapmotion����ϵ����2��3��4��5ָ����������꣨�ֱ�Ϊ��"CMC"��MCP��PIP��DIP��TIP��
[P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP]=getOC(A);

% ��ȡԭʼ����ϵ��leapmotion����ϵ����2��3��4��5ָ����ָ�ڵĳ���
[L_ind_MCP_PIP,L_ind_PIP_DIP,L_ind_DIP_TIP,L_ind,L_mid_MCP_PIP,L_mid_PIP_DIP,L_mid_DIP_TIP,L_mid,L_rin_MCP_PIP,L_rin_PIP_DIP,L_rin_DIP_TIP,L_rin,L_lit_MCP_PIP,L_lit_PIP_DIP,L_lit_DIP_TIP,L_lit]=getLengthOC(P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p);

% ��ȡ��������ϵ{1}����ָ����ϵ����2��3��4��5ָ����������꣨�ֱ�Ϊ��"CMC"��MCP��PIP��DIP��TIP��
[ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP]=getPosition(P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p);

% ��ȡ��������ϵ{1}����ָ����ϵ����2��3��4��5ָ����ָ�ڵĳ���
[L1_ind_MCP_PIP,L1_ind_PIP_DIP,L1_ind_DIP_TIP,L1_ind,L1_mid_MCP_PIP,L1_mid_PIP_DIP,L1_mid_DIP_TIP,L1_mid,L1_rin_MCP_PIP,L1_rin_PIP_DIP,L1_rin_DIP_TIP,L1_rin,L1_lit_MCP_PIP,L1_lit_PIP_DIP,L1_lit_DIP_TIP,L1_lit]=getLength(ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p);

% ��ȡ����ϵ{1}��2��3��4��5ָ���ؽ�ת�ǣ�����������  
[ind_angle_CMC,ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,mid_angle_CMC,mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,rin_angle_CMC,rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,lit_angle_CMC,lit_angle_MCP,lit_angle_PIP,lit_angle_DIP]=getAngles(ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p);
save('angle_data.mat','ind_angle_CMC','ind_angle_MCP','ind_angle_PIP','ind_angle_DIP','mid_angle_CMC','mid_angle_MCP','mid_angle_PIP','mid_angle_DIP','rin_angle_CMC','rin_angle_MCP','rin_angle_PIP','rin_angle_DIP','lit_angle_CMC','lit_angle_MCP','lit_angle_PIP','lit_angle_DIP');  %��������

% ����2��3��4��5ָ���ؽ�ת�Ǳ仯���ߺ͸��ؽ�ת��֮��Ĺ�ϵͼ��
printAngRel0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,ind_angle_CMC);%ʳָ�������������
% printAngRel1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP);%��ָ�������������
% printAngRel2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP);%����ָ����ָ��СĴָ�����´������
% printRelation1(mid_angle_MCP,rin_angle_MCP);            %��ָMCP������ָMCP��ϵ
% printRelation2(lit_angle_MCP,rin_angle_MCP);            %СĴָMCP������ָMCP��ϵ
% printAngRel3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP);%СĴָ�������������

% ����2��3��4��5ָ���ؽ�ת�Ǳ仯�����˲���ͼ��
doWaveFil0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,ind_angle_CMC);%�˲���ʳָ�������������
% doWaveFil1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP);%�˲�����ָ�������������
% doWaveFil2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP);%�˲�������ָ����ָ��СĴָ�����´������
% doWaveFil3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP);%�˲���СĴָ�������������
% doWaveFil(rin_angle_MCP, mid_angle_MCP);              %���������߷�һ��

% ��ȡ����ϵ{1}��2��3��4��5ָ���ؽڽ��ٶȣ��������˲�ǰ��ͼ��
[ind_angularSpeed_MCP,ind_angularSpeed_PIP,ind_angularSpeed_DIP]=getAngularSpeed0(ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,p);% ��ȡ����ϵ{1}��ʳָ���ؽڽ��ٶ�
% [mid_angularSpeed_MCP,mid_angularSpeed_PIP,mid_angularSpeed_DIP]=getAngularSpeed1(mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,p);% ��ȡ����ϵ{1}����ָ���ؽڽ��ٶ�
% [rin_angularSpeed_MCP,rin_angularSpeed_PIP,rin_angularSpeed_DIP]=getAngularSpeed2(rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,p);% ��ȡ����ϵ{1}������ָ���ؽڽ��ٶ�
% [lit_angularSpeed_MCP,lit_angularSpeed_PIP,lit_angularSpeed_DIP]=getAngularSpeed3(lit_angle_MCP,lit_angle_PIP,lit_angle_DIP,p);% ��ȡ����ϵ{1}��СĴָ���ؽڽ��ٶ�

% ��ȡ�����Ƕ����ֵ



