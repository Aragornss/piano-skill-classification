%% getLength1��������ȡ����ϵ{1}�и�ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ�Ĵָ�ƹǽڡ�Ĵָ��ָ�ڡ�ĴָԶָ�ڡ�Ĵָ�ܳ�)
function [L1_mid,L1_CMC_MCP,L1_MCP_IP,L1_IP_TIP,L1_Thumb,Dir1_CMC_MCP]=getLength1(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,p)
%% ��ȡ����ϵ{1}�и�ָ�ڳ���(�ֱ�Ϊ����ָ��ָ�ڡ�Ĵָ�ƹǽڡ�Ĵָ��ָ�ڡ�ĴָԶָ�ڡ�Ĵָ�ܳ�)
j=1;
for i=1:1:p
    %��ָָ������
    Dir1_CMC_MCP(:,j)=P1_MCP(:,i)-P1_CMC(:,i);%����ָ��
    Dir1_MCP_IP(:,j) =P1_IP(:,i) -P1_MCP(:,i);%��ָ��
    Dir1_IP_TIP(:,j) =P1_TIP(:,i)-P1_IP(:,i); %Զָ��
    Dir1_mid(:,j) =P1_mid_PIP(:,i)-P1_mid_MCP(:,i);%��ָ��ָ��
   
    L1_mid(j)=norm(Dir1_mid(:,j));
    L1_CMC_MCP(j)=norm(Dir1_CMC_MCP(:,j));
    L1_MCP_IP(j) =norm(Dir1_MCP_IP(:,j));
    L1_IP_TIP(j) =norm(Dir1_IP_TIP(:,j));
    L1_Thumb(j)=L1_CMC_MCP(j)+L1_MCP_IP(j)+L1_IP_TIP(j);
   
    j=j+1;
end