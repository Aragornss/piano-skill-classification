%% getPosition1��������������ϵ{1}����ָ����������,{1}ϵ����ԭ��Ϊ��ָMCP�ؽڵ�
function [ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP]=getPosition(P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p)
%% ��������ϵ{1}��ʳָ����������
for i=1:1:p
    %��ϵ���������ڶ�ϵ�е�ͶӰ
    Ez=[0;0;1];
    C1=[1 0 0;0 1 0;0 0 0];
    D=C1*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));%Ͷ���µ�xy���ϣ��ҳ��µ�y����
    Ey=D/norm(D);
    Ex=cross(Ey,Ez);%�̶�����ϵ����λ������Ey��Ez������ˣ��õ�Ex��
    %������ת����
    R=[Ex Ey Ez];   %{1}ϵ��{0}ϵ����ת����
    R2=R';          %{0}ϵ��{1}ϵ����ת����
    
    %ʳָ����������ϵ�е������{1}ϵ�е�����ֵ
    ind_CMC(:,i)=R2*(P0_ind_CMC(:,i)-P0_mid_MCP(:,i));
    ind_MCP(:,i)=R2*(P0_ind_MCP(:,i)-P0_mid_MCP(:,i));
    ind_PIP(:,i)=R2*(P0_ind_PIP(:,i)-P0_mid_MCP(:,i));
    ind_DIP(:,i)=R2*(P0_ind_DIP(:,i)-P0_mid_MCP(:,i));
    ind_TIP(:,i)=R2*(P0_ind_TIP(:,i)-P0_mid_MCP(:,i));

    %��ָ����������ϵ�е������{1}ϵ�е�����ֵ
    mid_CMC(:,i)=R2*(P0_mid_CMC(:,i)-P0_mid_MCP(:,i));
    mid_MCP(:,i)=R2*(P0_mid_MCP(:,i)-P0_mid_MCP(:,i));
    mid_PIP(:,i)=R2*(P0_mid_PIP(:,i)-P0_mid_MCP(:,i));
    mid_DIP(:,i)=R2*(P0_mid_DIP(:,i)-P0_mid_MCP(:,i));
    mid_TIP(:,i)=R2*(P0_mid_TIP(:,i)-P0_mid_MCP(:,i));

    %����ָ����������ϵ�е������{1}ϵ�е�����ֵ
    rin_CMC(:,i)=R2*(P0_Ring_CMC(:,i)-P0_mid_MCP(:,i));
    rin_MCP(:,i)=R2*(P0_Ring_MCP(:,i)-P0_mid_MCP(:,i));
    rin_PIP(:,i)=R2*(P0_Ring_PIP(:,i)-P0_mid_MCP(:,i));
    rin_DIP(:,i)=R2*(P0_Ring_DIP(:,i)-P0_mid_MCP(:,i));
    rin_TIP(:,i)=R2*(P0_Ring_TIP(:,i)-P0_mid_MCP(:,i));

    %СĴָ����������ϵ�е������{1}ϵ�е�����ֵ
    lit_CMC(:,i)=R2*(P0_Little_CMC(:,i)-P0_mid_MCP(:,i));
    lit_MCP(:,i)=R2*(P0_Little_MCP(:,i)-P0_mid_MCP(:,i));
    lit_PIP(:,i)=R2*(P0_Little_PIP(:,i)-P0_mid_MCP(:,i));
    lit_DIP(:,i)=R2*(P0_Little_DIP(:,i)-P0_mid_MCP(:,i));
    lit_TIP(:,i)=R2*(P0_Little_TIP(:,i)-P0_mid_MCP(:,i));
end