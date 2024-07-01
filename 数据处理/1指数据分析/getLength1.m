%% getLength1函数，获取坐标系{1}中各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
function [L1_mid,L1_CMC_MCP,L1_MCP_IP,L1_IP_TIP,L1_Thumb,Dir1_CMC_MCP]=getLength1(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,p)
%% 获取坐标系{1}中各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
j=1;
for i=1:1:p
    %手指指节向量
    Dir1_CMC_MCP(:,j)=P1_MCP(:,i)-P1_CMC(:,i);%掌腕指节
    Dir1_MCP_IP(:,j) =P1_IP(:,i) -P1_MCP(:,i);%近指节
    Dir1_IP_TIP(:,j) =P1_TIP(:,i)-P1_IP(:,i); %远指节
    Dir1_mid(:,j) =P1_mid_PIP(:,i)-P1_mid_MCP(:,i);%中指近指节
   
    L1_mid(j)=norm(Dir1_mid(:,j));
    L1_CMC_MCP(j)=norm(Dir1_CMC_MCP(:,j));
    L1_MCP_IP(j) =norm(Dir1_MCP_IP(:,j));
    L1_IP_TIP(j) =norm(Dir1_IP_TIP(:,j));
    L1_Thumb(j)=L1_CMC_MCP(j)+L1_MCP_IP(j)+L1_IP_TIP(j);
   
    j=j+1;
end