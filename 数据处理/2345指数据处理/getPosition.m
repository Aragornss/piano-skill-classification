%% getPosition1函数，计算坐标系{1}下中指特征点坐标,{1}系坐标原点为中指MCP关节点
function [ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP]=getPosition(P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p)
%% 计算坐标系{1}下食指特征点坐标
for i=1:1:p
    %新系各坐标轴在定系中的投影
    Ez=[0;0;1];
    C1=[1 0 0;0 1 0;0 0 0];
    D=C1*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));%投到新的xy面上，找出新的y向量
    Ey=D/norm(D);
    Ex=cross(Ey,Ez);%固定坐标系各单位向量（Ey和Ez向量叉乘，得到Ex）
    %构建旋转矩阵
    R=[Ex Ey Ez];   %{1}系向{0}系的旋转矩阵
    R2=R';          %{0}系向{1}系的旋转矩阵
    
    %食指特征点在新系中的坐标表达，{1}系中的坐标值
    ind_CMC(:,i)=R2*(P0_ind_CMC(:,i)-P0_mid_MCP(:,i));
    ind_MCP(:,i)=R2*(P0_ind_MCP(:,i)-P0_mid_MCP(:,i));
    ind_PIP(:,i)=R2*(P0_ind_PIP(:,i)-P0_mid_MCP(:,i));
    ind_DIP(:,i)=R2*(P0_ind_DIP(:,i)-P0_mid_MCP(:,i));
    ind_TIP(:,i)=R2*(P0_ind_TIP(:,i)-P0_mid_MCP(:,i));

    %中指特征点在新系中的坐标表达，{1}系中的坐标值
    mid_CMC(:,i)=R2*(P0_mid_CMC(:,i)-P0_mid_MCP(:,i));
    mid_MCP(:,i)=R2*(P0_mid_MCP(:,i)-P0_mid_MCP(:,i));
    mid_PIP(:,i)=R2*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));
    mid_DIP(:,i)=R2*(P0_mid_DIP(:,i)-P0_mid_MCP(:,i));
    mid_TIP(:,i)=R2*(P0_mid_TIP(:,i)-P0_mid_MCP(:,i));

    %无名指特征点在新系中的坐标表达，{1}系中的坐标值
    rin_CMC(:,i)=R2*(P0_Ring_CMC(:,i)-P0_mid_MCP(:,i));
    rin_MCP(:,i)=R2*(P0_Ring_MCP(:,i)-P0_mid_MCP(:,i));
    rin_PIP(:,i)=R2*(P0_Ring_PIP(:,i)-P0_mid_MCP(:,i));
    rin_DIP(:,i)=R2*(P0_Ring_DIP(:,i)-P0_mid_MCP(:,i));
    rin_TIP(:,i)=R2*(P0_Ring_TIP(:,i)-P0_mid_MCP(:,i));

    %小拇指特征点在新系中的坐标表达，{1}系中的坐标值
    lit_CMC(:,i)=R2*(P0_Little_CMC(:,i)-P0_mid_MCP(:,i));
    lit_MCP(:,i)=R2*(P0_Little_MCP(:,i)-P0_mid_MCP(:,i));
    lit_PIP(:,i)=R2*(P0_Little_PIP(:,i)-P0_mid_MCP(:,i));
    lit_DIP(:,i)=R2*(P0_Little_DIP(:,i)-P0_mid_MCP(:,i));
    lit_TIP(:,i)=R2*(P0_Little_TIP(:,i)-P0_mid_MCP(:,i));
end