%% getPosition1��������������ϵ{1}����ָ����������
function [P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP]=getPosition1(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p)
%% ��������ϵ{1}����ָ����������
j=1;
for i=1:1:p
    %��ϵ���������ڶ�ϵ�е�ͶӰ
    Ez=[0;0;1];
    C1=[1 0 0;0 1 0;0 0 0];
    C2=[0 0 0;0 1 0;0 0 1];
    D=C1*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));
    Ey=D/norm(D);
    Ex=cross(Ey,Ez);%�̶�����ϵ����λ����
    %������ת����
    R=[Ex Ey Ez];   %{1}ϵ��{0}ϵ����ת����
    R2=R';          %{0}ϵ��{1}ϵ����ת����
    
    %��ָ����������ϵ�е������{1}ϵ�е�����ֵ
    P1_CMC(:,j)=R2*(P0_CMC(:,i)-P0_CMC(:,i));
    P1_MCP(:,j)=R2*(P0_MCP(:,i)-P0_CMC(:,i));
    P1_IP(:,j) =R2*(P0_IP(:,i)-P0_CMC(:,i));
    P1_TIP(:,j)=R2*(P0_TIP(:,i)-P0_CMC(:,i));
    P1_mid_MCP(:,j)=R2*(P0_mid_MCP(:,i)-P0_CMC(:,i));
    P1_mid_PIP(:,j)=R2*(P0_mid_PIP(:,i)-P0_CMC(:,i));
    
    j=j+1;
end