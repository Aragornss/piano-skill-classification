%% getAngles函数，获取坐标系{1}中手指各关节转角(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,angle_F)及中指倾斜角c与拇指平面验证角angle
function [angle,c,angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,F]=getAngles(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,L_mid,p)
%% 获取坐标系{1}中手指各关节转角(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,angle_F)及中指倾斜角c与拇指平面验证角angle
for i=1:1:p
    %手指指节向量
    Dir1_CMC_MCP(:,i)=P1_MCP(:,i)-P1_CMC(:,i);%掌腕指节
    Dir1_MCP_IP(:,i) =P1_IP(:,i) -P1_MCP(:,i);%近指节
    Dir1_IP_TIP(:,i) =P1_TIP(:,i)-P1_IP(:,i); %远指节
    Dir1_mid(:,i) =P1_mid_PIP(:,i)-P1_mid_MCP(:,i);%中指近指节
    
    %中指倾斜角
    c(i)=asin((P1_mid_PIP(3,i)-P1_mid_MCP(3,i))/ L_mid(i))/pi*180;
    
    %拇指平面验证(angle=90°，则拇指各特征点处于同一平面内)
    v1=P1_MCP(:,i)-P1_CMC(:,i);
    v2=P1_IP(:,i)-P1_MCP(:,i);
    v3=P1_TIP(:,i)-P1_IP(:,i);
    e1=(cross(v2,v1))';
    e2=v3;
    angle(i)=acos(dot(e1,e2)/(norm(e1)*norm(e2)))/pi*180;
    %手指平面法向量
    F(:,i)=cross(v2,v1);
    
    %拇指关节转角
    C1=[1 0 0;0 1 0;0 0 0];
    C2=[0 0 0;0 1 0;0 0 1];
    %{1}系中拇指MCP关节在XY平面上的投影
    PXY_MCP=C1*P1_MCP(:,i);
    %{1}系中拇指MCP关节在YZ平面上的投影
    PYZ_MCP=C2*P1_MCP(:,i);
    
    %CMC关节在水平面和竖直面内的夹角
    angle_r_CMC_MCP_XY(i)=acos(PXY_MCP(2)/norm(PXY_MCP))/pi*180;
    angle_r_CMC_MCP_YZ(i)=asin(PYZ_MCP(3)/norm(PYZ_MCP))/pi*180;
    %拇指MCP与IP关节角度
    angle_MCP(i)=180-(acos(dot(Dir1_CMC_MCP(:,i),( Dir1_MCP_IP(:,i)))/(norm(Dir1_CMC_MCP(:,i))*norm( Dir1_MCP_IP(:,i)))))/pi*180;
    angle_IP(i) =180-(acos(dot(Dir1_MCP_IP(:,i),( Dir1_IP_TIP(:,i)))/(norm(Dir1_MCP_IP(:,i))*norm( Dir1_IP_TIP(:,i)))))/pi*180;   
end

thta_max=max(c)
thta_min=min(c)
alpha_max=max(angle_r_CMC_MCP_XY)
alpha_min=min(angle_r_CMC_MCP_XY)
beta_max=max(angle_r_CMC_MCP_YZ)
beta_min=min(angle_r_CMC_MCP_YZ)
sigma_max=max(angle_MCP)
sigma_min=min(angle_MCP)
phi_max=max(angle_IP)
phi_min=min(angle_IP)