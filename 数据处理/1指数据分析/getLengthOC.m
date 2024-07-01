%% getLengthOC函数，获取原始坐标系下各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
function [L_mid,L_CMC_MCP,L_MCP_IP,L_IP_TIP,L]=getLengthOC(P0_CMC,P0_MCP,P0_IP,P0_TIP,P0_mid_MCP,P0_mid_PIP,p)
%% 获取原始坐标系下各指节长度(分别为：中指近指节、拇指掌骨节、拇指近指节、拇指远指节、拇指总长)
j=1;
for i=1:1:p
   L_mid(j)=norm(P0_mid_PIP(:,i)-P0_mid_MCP(:,i)); 
   L_CMC_MCP(j)=norm(P0_MCP(:,i)-P0_CMC(:,i));
   L_MCP_IP(j) =norm(P0_IP(:,i)-P0_MCP(:,i));
   L_IP_TIP(j) =norm(P0_TIP(:,i)-P0_IP(:,i));
   L(j)=L_CMC_MCP(j)+L_MCP_IP(j)+ L_IP_TIP(j); 
   j=j+1;
end
