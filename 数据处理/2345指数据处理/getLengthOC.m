 %% getLengthOC函数，获取原始坐标系下各手指各个指节长度和手指总长
function [L_ind_MCP_PIP,L_ind_PIP_DIP,L_ind_DIP_TIP,L_ind,L_mid_MCP_PIP,L_mid_PIP_DIP,L_mid_DIP_TIP,L_mid,L_rin_MCP_PIP,L_rin_PIP_DIP,L_rin_DIP_TIP,L_rin,L_lit_MCP_PIP,L_lit_PIP_DIP,L_lit_DIP_TIP,L_lit]=getLengthOC(P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP,p)

for i=1:1:p
    % 获取原始坐标系下食指各指节长度(分别为：食指掌指节、食指近指节、食指远指节、食指总长)
    L_ind_MCP_PIP(i)=norm(P0_ind_PIP(:,i)-P0_ind_MCP(:,i)); %食指MCP到PIP之间的长度 norm计算两点之间的距离 a(:,1)为取a矩阵中第一列元素 a(1,:)为取a矩阵中第一行元素
    L_ind_PIP_DIP(i)=norm(P0_ind_DIP(:,i)-P0_ind_PIP(:,i));
    L_ind_DIP_TIP(i) =norm(P0_ind_TIP(:,i)-P0_ind_DIP(:,i));
    L_ind(i)=L_ind_MCP_PIP(i)+L_ind_PIP_DIP(i)+ L_ind_DIP_TIP(i); %食指长度

    % 获取原始坐标系下中指各指节长度(分别为：中指掌指节、中指近指节、中指远指节、中指总长)
    L_mid_MCP_PIP(i)=norm(P0_mid_PIP(:,i)-P0_mid_MCP(:,i)); %中指MCP到PIP之间的长度 norm计算两点之间的距离 a(:,1)为取a矩阵中第一列元素 a(1,:)为取a矩阵中第一行元素
    L_mid_PIP_DIP(i)=norm(P0_mid_DIP(:,i)-P0_mid_PIP(:,i));
    L_mid_DIP_TIP(i) =norm(P0_mid_TIP(:,i)-P0_mid_DIP(:,i));
    L_mid(i)=L_mid_MCP_PIP(i)+L_mid_PIP_DIP(i)+ L_mid_DIP_TIP(i); %中指长度

    % 获取原始坐标系下无名指各指节长度(分别为：无名指掌指节、无名指近指节、无名指远指节、无名指总长)
    L_rin_MCP_PIP(i)=norm(P0_Ring_PIP(:,i)-P0_Ring_MCP(:,i)); %无名指MCP到PIP之间的长度 norm计算两点之间的距离 a(:,1)为取a矩阵中第一列元素 a(1,:)为取a矩阵中第一行元素
    L_rin_PIP_DIP(i)=norm(P0_Ring_DIP(:,i)-P0_Ring_PIP(:,i));
    L_rin_DIP_TIP(i) =norm(P0_Ring_TIP(:,i)-P0_Ring_DIP(:,i));
    L_rin(i)=L_rin_MCP_PIP(i)+L_rin_PIP_DIP(i)+ L_rin_DIP_TIP(i); %无名指长度

    % 获取原始坐标系下小拇指各指节长度(分别为：小拇指掌骨节、小拇指近指节、小拇指远指节、小拇指总长)
    L_lit_MCP_PIP(i)=norm(P0_Little_PIP(:,i)-P0_Little_MCP(:,i)); %小拇指MCP到PIP之间的长度 norm计算两点之间的距离 a(:,1)为取a矩阵中第一列元素 a(1,:)为取a矩阵中第一行元素
    L_lit_PIP_DIP(i)=norm(P0_Little_DIP(:,i)-P0_Little_PIP(:,i));
    L_lit_DIP_TIP(i) =norm(P0_Little_TIP(:,i)-P0_Little_DIP(:,i));
    L_lit(i)=L_lit_MCP_PIP(i)+L_lit_PIP_DIP(i)+ L_lit_DIP_TIP(i); %小拇指长度
end