%% getLength��������ȡ����ϵ{1}�¸���ָ����ָ�ڳ��Ⱥ���ָ�ܳ�
function [L1_ind_MCP_PIP,L1_ind_PIP_DIP,L1_ind_DIP_TIP,L1_ind,L1_mid_MCP_PIP,L1_mid_PIP_DIP,L1_mid_DIP_TIP,L1_mid,L1_rin_MCP_PIP,L1_rin_PIP_DIP,L1_rin_DIP_TIP,L1_rin,L1_lit_MCP_PIP,L1_lit_PIP_DIP,L1_lit_DIP_TIP,L1_lit]=getLength(ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p)

for i=1:1:p
    % ��ȡ����ϵ{1}��ʳָ��ָ�ڳ���(�ֱ�Ϊ��ʳָ��ָ�ڡ�ʳָ��ָ�ڡ�ʳָԶָ�ڡ�ʳָ�ܳ�)
    L1_ind_MCP_PIP(i)=norm(ind_PIP(:,i)-ind_MCP(:,i));%��ָ��
    L1_ind_PIP_DIP(i)=norm(ind_DIP(:,i)-ind_PIP(:,i));%��ָ��
    L1_ind_DIP_TIP(i)=norm(ind_TIP(:,i)-ind_DIP(:,i));%Զָ��
    L1_ind(i)=L1_ind_MCP_PIP(i) + L1_ind_PIP_DIP(i) +L1_ind_DIP_TIP(i) ;

    % ��ȡ����ϵ{1}����ָ��ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ���ָ��ָ�ڡ���ָԶָ�ڡ���ָ�ܳ�)
    L1_mid_MCP_PIP(i)=norm(mid_PIP(:,i)-mid_MCP(:,i));%��ָ��
    L1_mid_PIP_DIP(i)=norm(mid_DIP(:,i)-mid_PIP(:,i));%��ָ��
    L1_mid_DIP_TIP(i)=norm(mid_TIP(:,i)-mid_DIP(:,i));%Զָ��
    L1_mid(i)=L1_mid_MCP_PIP(i) + L1_mid_PIP_DIP(i) +L1_mid_DIP_TIP(i) ;

    % ��ȡ����ϵ{1}������ָ��ָ�ڳ���(�ֱ�Ϊ������ָ��ָ�ڡ�����ָ��ָ�ڡ�����ָԶָ�ڡ�����ָ�ܳ�)
    L1_rin_MCP_PIP(i)=norm(rin_PIP(:,i)-rin_MCP(:,i));%��ָ��
    L1_rin_PIP_DIP(i)=norm(rin_DIP(:,i)-rin_PIP(:,i));%��ָ��
    L1_rin_DIP_TIP(i)=norm(rin_TIP(:,i)-rin_DIP(:,i));%Զָ��
    L1_rin(i)=L1_rin_MCP_PIP(i) + L1_rin_PIP_DIP(i) +L1_rin_DIP_TIP(i) ;

    % ��ȡ����ϵ{1}��СĴָ��ָ�ڳ���(�ֱ�Ϊ��СĴָ��ָ�ڡ�СĴָ��ָ�ڡ�СĴָԶָ�ڡ�СĴָ�ܳ�)
    L1_lit_MCP_PIP(i)=norm(lit_PIP(:,i)-lit_MCP(:,i));%��ָ��
    L1_lit_PIP_DIP(i)=norm(lit_DIP(:,i)-lit_PIP(:,i));%��ָ��
    L1_lit_DIP_TIP(i)=norm(lit_TIP(:,i)-lit_DIP(:,i));%Զָ��
    L1_lit(i)=L1_lit_MCP_PIP(i) + L1_lit_PIP_DIP(i) +L1_lit_DIP_TIP(i) ;
end