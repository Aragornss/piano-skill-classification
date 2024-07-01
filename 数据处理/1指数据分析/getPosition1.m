%% getPosition1函数，计算坐标系{1}中手指特征点坐标
function [P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP]=getPosition1(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p)
%% 计算坐标系{1}中手指特征点坐标
j=1;
for i=1:1:p
    %新系各坐标轴在定系中的投影
    Ez=[0;0;1];
    C1=[1 0 0;0 1 0;0 0 0];
    C2=[0 0 0;0 1 0;0 0 1];
    D=C1*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));
    Ey=D/norm(D);
    Ex=cross(Ey,Ez);%固定坐标系各单位向量
    %构建旋转矩阵
    R=[Ex Ey Ez];   %{1}系向{0}系的旋转矩阵
    R2=R';          %{0}系向{1}系的旋转矩阵
    
    %手指特征点在新系中的坐标表达，{1}系中的坐标值
    P1_CMC(:,j)=R2*(P0_CMC(:,i)-P0_CMC(:,i));
    P1_MCP(:,j)=R2*(P0_MCP(:,i)-P0_CMC(:,i));
    P1_IP(:,j) =R2*(P0_IP(:,i)-P0_CMC(:,i));
    P1_TIP(:,j)=R2*(P0_TIP(:,i)-P0_CMC(:,i));
    P1_mid_MCP(:,j)=R2*(P0_mid_MCP(:,i)-P0_CMC(:,i));
    P1_mid_PIP(:,j)=R2*(P0_mid_PIP(:,i)-P0_CMC(:,i));
    
    j=j+1;
end