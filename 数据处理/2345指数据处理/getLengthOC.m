 %% getLengthOC��������ȡԭʼ����ϵ�¸���ָ����ָ�ڳ��Ⱥ���ָ�ܳ�
function [L_ind_MCP_PIP,L_ind_PIP_DIP,L_ind_DIP_TIP,L_ind,L_mid_MCP_PIP,L_mid_PIP_DIP,L_mid_DIP_TIP,L_mid,L_rin_MCP_PIP,L_rin_PIP_DIP,L_rin_DIP_TIP,L_rin,L_lit_MCP_PIP,L_lit_PIP_DIP,L_lit_DIP_TIP,L_lit]=getLengthOC(P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p)

for i=1:1:p
    % ��ȡԭʼ����ϵ��ʳָ��ָ�ڳ���(�ֱ�Ϊ��ʳָ��ָ�ڡ�ʳָ��ָ�ڡ�ʳָԶָ�ڡ�ʳָ�ܳ�)
    L_ind_MCP_PIP(i)=norm(P0_ind_PIP(:,i)-P0_ind_MCP(:,i)); %ʳָMCP��PIP֮��ĳ��� norm��������֮��ľ��� a(:,1)Ϊȡa�����е�һ��Ԫ�� a(1,:)Ϊȡa�����е�һ��Ԫ��
    L_ind_PIP_DIP(i)=norm(P0_ind_DIP(:,i)-P0_ind_PIP(:,i));
    L_ind_DIP_TIP(i) =norm(P0_ind_TIP(:,i)-P0_ind_DIP(:,i));
    L_ind(i)=L_ind_MCP_PIP(i)+L_ind_PIP_DIP(i)+ L_ind_DIP_TIP(i); %ʳָ����

    % ��ȡԭʼ����ϵ����ָ��ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ���ָ��ָ�ڡ���ָԶָ�ڡ���ָ�ܳ�)
    L_mid_MCP_PIP(i)=norm(P0_mid_PIP(:,i)-P0_mid_MCP(:,i)); %��ָMCP��PIP֮��ĳ��� norm��������֮��ľ��� a(:,1)Ϊȡa�����е�һ��Ԫ�� a(1,:)Ϊȡa�����е�һ��Ԫ��
    L_mid_PIP_DIP(i)=norm(P0_mid_DIP(:,i)-P0_mid_PIP(:,i));
    L_mid_DIP_TIP(i) =norm(P0_mid_TIP(:,i)-P0_mid_DIP(:,i));
    L_mid(i)=L_mid_MCP_PIP(i)+L_mid_PIP_DIP(i)+ L_mid_DIP_TIP(i); %��ָ����

    % ��ȡԭʼ����ϵ������ָ��ָ�ڳ���(�ֱ�Ϊ������ָ��ָ�ڡ�����ָ��ָ�ڡ�����ָԶָ�ڡ�����ָ�ܳ�)
    L_rin_MCP_PIP(i)=norm(P0_Ring_PIP(:,i)-P0_Ring_MCP(:,i)); %����ָMCP��PIP֮��ĳ��� norm��������֮��ľ��� a(:,1)Ϊȡa�����е�һ��Ԫ�� a(1,:)Ϊȡa�����е�һ��Ԫ��
    L_rin_PIP_DIP(i)=norm(P0_Ring_DIP(:,i)-P0_Ring_PIP(:,i));
    L_rin_DIP_TIP(i) =norm(P0_Ring_TIP(:,i)-P0_Ring_DIP(:,i));
    L_rin(i)=L_rin_MCP_PIP(i)+L_rin_PIP_DIP(i)+ L_rin_DIP_TIP(i); %����ָ����

    % ��ȡԭʼ����ϵ��СĴָ��ָ�ڳ���(�ֱ�Ϊ��СĴָ�ƹǽڡ�СĴָ��ָ�ڡ�СĴָԶָ�ڡ�СĴָ�ܳ�)
    L_lit_MCP_PIP(i)=norm(P0_Little_PIP(:,i)-P0_Little_MCP(:,i)); %СĴָMCP��PIP֮��ĳ��� norm��������֮��ľ��� a(:,1)Ϊȡa�����е�һ��Ԫ�� a(1,:)Ϊȡa�����е�һ��Ԫ��
    L_lit_PIP_DIP(i)=norm(P0_Little_DIP(:,i)-P0_Little_PIP(:,i));
    L_lit_DIP_TIP(i) =norm(P0_Little_TIP(:,i)-P0_Little_DIP(:,i));
    L_lit(i)=L_lit_MCP_PIP(i)+L_lit_PIP_DIP(i)+ L_lit_DIP_TIP(i); %СĴָ����
end