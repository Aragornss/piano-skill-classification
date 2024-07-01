%% getAngles函数，获取坐标系{1}下食指、中指、无名指、小拇指各关节转角
function [ind_angle_CMC,ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,mid_angle_CMC,mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,rin_angle_CMC,rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,lit_angle_CMC,lit_angle_MCP,lit_angle_PIP,lit_angle_DIP]=getAngles(ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p)

for i=1:1:p
    %食指指节向量
    Dir0_CMC_MCP(:,i) = ind_MCP(:,i) - ind_CMC(:,i);%掌骨
    Dir0_MCP_PIP(:,i) = ind_PIP(:,i) - ind_MCP(:,i);%掌指节
    Dir0_PIP_DIP(:,i) = ind_DIP(:,i) - ind_PIP(:,i);%近指节
    Dir0_DIP_TIP(:,i) = ind_TIP(:,i) - ind_DIP(:,i);%远指节

    %中指指节向量
    Dir1_CMC_MCP(:,i) = mid_MCP(:,i) - mid_CMC(:,i);%掌骨
    Dir1_MCP_PIP(:,i) = mid_PIP(:,i) - mid_MCP(:,i);%掌指节
    Dir1_PIP_DIP(:,i) = mid_DIP(:,i) - mid_PIP(:,i);%近指节
    Dir1_DIP_TIP(:,i) = mid_TIP(:,i) - mid_DIP(:,i);%远指节

    %无名指指节向量
    Dir2_CMC_MCP(:,i) = rin_MCP(:,i) - rin_CMC(:,i);%掌骨
    Dir2_MCP_PIP(:,i) = rin_PIP(:,i) - rin_MCP(:,i);%掌指节
    Dir2_PIP_DIP(:,i) = rin_DIP(:,i) - rin_PIP(:,i);%近指节
    Dir2_DIP_TIP(:,i) = rin_TIP(:,i) - rin_DIP(:,i);%远指节
      
    %小拇指指节向量
    Dir3_CMC_MCP(:,i) = lit_MCP(:,i) - lit_CMC(:,i);%掌骨
    Dir3_MCP_PIP(:,i) = lit_PIP(:,i) - lit_MCP(:,i);%掌指节
    Dir3_PIP_DIP(:,i) = lit_DIP(:,i) - lit_PIP(:,i);%近指节
    Dir3_DIP_TIP(:,i) = lit_TIP(:,i) - lit_DIP(:,i);%远指节

    %食指CMC处与水平面夹角         公式理解：arcsin(MCP到水平面的距离/CMC到MCP的距离)/pi*180
    ind_angle_CMC(i)=asin((ind_MCP(3,i)-ind_CMC(3,i))/ norm(Dir0_CMC_MCP(:,i)) )/pi*180;
    %食指MCP、PIP、DIP处夹角       公式理解：arccos(两个向量的点积/两个向量的模的积)/pi*180
    ind_angle_MCP(i)=acos(dot(Dir0_CMC_MCP(:,i),( Dir0_MCP_PIP(:,i)))/(norm(Dir0_CMC_MCP(:,i))*norm( Dir0_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir0_CMC_MCP(:,i),Dir0_MCP_PIP(:,i));%计算掌骨与掌指节叉乘方向向量，用于改变夹角的方向，因为夹角的值在0°附近，而acos算出来都是正的
    if n(1)>0
        ind_angle_MCP(i) = -ind_angle_MCP(i);
    end
    ind_angle_PIP(i)=acos(dot(Dir0_MCP_PIP(:,i),( Dir0_PIP_DIP(:,i)))/(norm(Dir0_MCP_PIP(:,i))*norm( Dir0_PIP_DIP(:,i))))/pi*180;
    ind_angle_DIP(i)=acos(dot(Dir0_PIP_DIP(:,i),( Dir0_DIP_TIP(:,i)))/(norm(Dir0_PIP_DIP(:,i))*norm( Dir0_DIP_TIP(:,i))))/pi*180;
    
    %中指CMC处与水平面夹角
    mid_angle_CMC(i)=asin((mid_MCP(3,i)-mid_CMC(3,i))/ norm(Dir1_CMC_MCP(:,i)) )/pi*180;
    %中指MCP、PIP、DIP处夹角 
    mid_angle_MCP(i)=acos(dot(Dir1_CMC_MCP(:,i),( Dir1_MCP_PIP(:,i)))/(norm(Dir1_CMC_MCP(:,i))*norm( Dir1_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir1_CMC_MCP(:,i),Dir1_MCP_PIP(:,i));
    if n(1)>0
        mid_angle_MCP(i) = -mid_angle_MCP(i);
    end
    mid_angle_PIP(i)=acos(dot(Dir1_MCP_PIP(:,i),( Dir1_PIP_DIP(:,i)))/(norm(Dir1_MCP_PIP(:,i))*norm( Dir1_PIP_DIP(:,i))))/pi*180;
    mid_angle_DIP(i)=acos(dot(Dir1_PIP_DIP(:,i),( Dir1_DIP_TIP(:,i)))/(norm(Dir1_PIP_DIP(:,i))*norm( Dir1_DIP_TIP(:,i))))/pi*180;

    %无名指CMC处与水平面夹角
    rin_angle_CMC(i)=asin((rin_MCP(3,i)-rin_CMC(3,i))/ norm(Dir2_CMC_MCP(:,i)) )/pi*180;
    %无名指MCP、PIP、DIP处夹角
    rin_angle_MCP(i)=acos(dot(Dir2_CMC_MCP(:,i),( Dir2_MCP_PIP(:,i)))/(norm(Dir2_CMC_MCP(:,i))*norm( Dir2_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir2_CMC_MCP(:,i),Dir2_MCP_PIP(:,i));
    if n(1)>0
        rin_angle_MCP(i) = -rin_angle_MCP(i);
    end
    rin_angle_PIP(i)=acos(dot(Dir2_MCP_PIP(:,i),( Dir2_PIP_DIP(:,i)))/(norm(Dir2_MCP_PIP(:,i))*norm( Dir2_PIP_DIP(:,i))))/pi*180;
    rin_angle_DIP(i)=acos(dot(Dir2_PIP_DIP(:,i),( Dir2_DIP_TIP(:,i)))/(norm(Dir2_PIP_DIP(:,i))*norm( Dir2_DIP_TIP(:,i))))/pi*180;
        
    %小拇指CMC处与水平面夹角
    lit_angle_CMC(i)=asin((lit_MCP(3,i)-lit_CMC(3,i))/ norm(Dir3_CMC_MCP(:,i)) )/pi*180;
    %小拇指MCP、PIP、DIP处夹角
    lit_angle_MCP(i)=acos(dot(Dir3_CMC_MCP(:,i),( Dir3_MCP_PIP(:,i)))/(norm(Dir3_CMC_MCP(:,i))*norm( Dir3_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir3_CMC_MCP(:,i),Dir3_MCP_PIP(:,i));
    if n(1)>0
        lit_angle_MCP(i) = -lit_angle_MCP(i);
    end
    lit_angle_PIP(i)=acos(dot(Dir3_MCP_PIP(:,i),( Dir3_PIP_DIP(:,i)))/(norm(Dir3_MCP_PIP(:,i))*norm( Dir3_PIP_DIP(:,i))))/pi*180;
    lit_angle_DIP(i)=acos(dot(Dir3_PIP_DIP(:,i),( Dir3_DIP_TIP(:,i)))/(norm(Dir3_PIP_DIP(:,i))*norm( Dir3_DIP_TIP(:,i))))/pi*180;
end

%%分别记录食指CMC、MCP、PIP、DIP最大角度
% xlswrite(filename,A,xlRange) 将数据写入工作簿的第一个工作表中由 xlRange 指定的矩形区域内。使用 Excel 范围语法，例如 'A1:C3'。
max_ind_angle_CMC=max(ind_angle_CMC)
xlswrite('filename', max_ind_angle_CMC, 'A1','A1')
min_ind_angle_CMC=min(ind_angle_CMC)
xlswrite('filename', min_ind_angle_CMC, 'A1','A2')
max_ind_angle_MCP=max(ind_angle_MCP)
xlswrite('filename', max_ind_angle_MCP, 'A1','A3')
min_ind_angle_MCP=min(ind_angle_MCP)
xlswrite('filename', min_ind_angle_MCP, 'A1','A4')
max_ind_angle_PIP=max(ind_angle_PIP)
xlswrite('filename', max_ind_angle_PIP, 'A1','A5')
min_ind_angle_PIP=min(ind_angle_PIP)
xlswrite('filename', min_ind_angle_PIP, 'A1','A6')
max_ind_angle_DIP=max(ind_angle_DIP)
xlswrite('filename', max_ind_angle_DIP, 'A1','A7')
min_ind_angle_DIP=min(ind_angle_DIP)
xlswrite('filename', min_ind_angle_DIP, 'A1','A8')

%%分别记录中指CMC、MCP、PIP、DIP最大角度
% xlswrite(filename,A,xlRange) 将数据写入工作簿的第一个工作表中由 xlRange 指定的矩形区域内。使用 Excel 范围语法，例如 'A1:C3'。
max_mid_angle_CMC=max(mid_angle_CMC)
xlswrite('filename', max_mid_angle_CMC, 'A1','B1')
min_mid_angle_CMC=min(mid_angle_CMC)
xlswrite('filename', min_mid_angle_CMC, 'A1','B2')
max_mid_angle_MCP=max(mid_angle_MCP)
xlswrite('filename', max_mid_angle_MCP, 'A1','B3')
min_mid_angle_MCP=min(mid_angle_MCP)
xlswrite('filename', min_mid_angle_MCP, 'A1','B4')
max_mid_angle_PIP=max(mid_angle_PIP)
xlswrite('filename', max_mid_angle_PIP, 'A1','B5')
min_mid_angle_PIP=min(mid_angle_PIP)
xlswrite('filename', min_mid_angle_PIP, 'A1','B6')
max_mid_angle_DIP=max(mid_angle_DIP)
xlswrite('filename', max_mid_angle_DIP, 'A1','B7')
min_mid_angle_DIP=min(mid_angle_DIP)
xlswrite('filename', min_mid_angle_DIP, 'A1','B8')

%%分别记录无名指CMC、MCP、PIP、DIP最大角度
max_rin_angle_CMC=max(rin_angle_CMC)
xlswrite('filename', max_rin_angle_CMC, 'A1','C1')
min_rin_angle_CMC=min(rin_angle_CMC)
xlswrite('filename', min_rin_angle_CMC, 'A1','C2')
max_rin_angle_MCP=max(rin_angle_MCP)
xlswrite('filename', max_rin_angle_MCP, 'A1','C3')
min_rin_angle_MCP=min(rin_angle_MCP)
xlswrite('filename', min_rin_angle_MCP, 'A1','C4')
max_rin_angle_PIP=max(rin_angle_PIP)
xlswrite('filename', max_rin_angle_PIP, 'A1','C5')
min_rin_angle_PIP=min(rin_angle_PIP)
xlswrite('filename', min_rin_angle_PIP, 'A1','C6')
max_rin_angle_DIP=max(rin_angle_DIP)
xlswrite('filename', max_rin_angle_DIP, 'A1','C7')
min_rin_angle_DIP=min(rin_angle_DIP)
xlswrite('filename', min_rin_angle_DIP, 'A1','C8')

%%分别记录小拇指CMC、MCP、PIP、DIP最大角度
max_lit_angle_CMC=max(lit_angle_CMC)
xlswrite('filename', max_lit_angle_CMC, 'A1','D1')
min_lit_angle_CMC=min(lit_angle_CMC)
xlswrite('filename', min_lit_angle_CMC, 'A1','D2')
max_lit_angle_MCP=max(lit_angle_MCP)
xlswrite('filename', max_lit_angle_MCP, 'A1','D3')
min_lit_angle_MCP=min(lit_angle_MCP)
xlswrite('filename', min_lit_angle_MCP, 'A1','D4')
max_lit_angle_PIP=max(lit_angle_PIP)
xlswrite('filename', max_lit_angle_PIP, 'A1','D5')
min_lit_angle_PIP=min(lit_angle_PIP)
xlswrite('filename', min_lit_angle_PIP, 'A1','D6')
max_lit_angle_DIP=max(lit_angle_DIP)
xlswrite('filename', max_lit_angle_DIP, 'A1','D7')
min_lit_angle_DIP=min(lit_angle_DIP)
xlswrite('filename', min_lit_angle_DIP, 'A1','D8')

% 直接打开生成的excel文件，方便汇总数据
winopen('filename.xls');