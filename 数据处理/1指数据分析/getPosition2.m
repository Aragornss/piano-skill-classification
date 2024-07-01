%% getPosition2函数，获取坐标系{2}中手指特征点坐标
function angle_F=getPosition2(P0_CMC,P0_MCP,P0_IP,P0_TIP,p)
%% 获取坐标系{2}中手指特征点坐标
j=1;
for i=1:1:p
    %%计算掌指节自身转角
    %建立新动系{2}
    Dir0_CMC_MCP=P0_MCP(:,i)-P0_CMC(:,i);%定系{0}中CMC-MCP矢量
    Ey2=Dir0_CMC_MCP/norm(Dir0_CMC_MCP);%Ey2与掌指节重合，且指向向前
    Z_z=[0;0;1];%CMC处竖直向上的向量
    Ex2=cross(Ey2,Z_z)/norm(cross(Ey2,Z_z));%Ex2在水平方向，指向斜向右前方
    Ez2=cross(Ex2,Ey2)/norm(cross(Ex2,Ey2));%Ez2在竖直平面内，指向斜前方
    R3=[Ex2 Ey2 Ez2];   %{2}系向{0}系的转化
    R4=R3';             %{0}系向{2}系的转化
    P2_CMC=R4*(P0_CMC(:,i)-P0_CMC(:,i));%各特征点在新系{2}中的描述
    P2_MCP=R4*(P0_MCP(:,i)-P0_CMC(:,i));
    P2_IP =R4*(P0_IP(:,i)-P0_CMC(:,i));
    P2_TIP=R4*(P0_TIP(:,i)-P0_CMC(:,i));
    %新系2中各指节向量
    Dir2_CMC_MCP(:,j)=P2_MCP-P2_CMC;%掌腕指节
    Dir2_MCP_IP(:,j) =P2_IP-P2_MCP;%近指节
    Dir2_IP_TIP(:,j) =P2_TIP-P2_IP; %远指节
    Dir2_CMC_TIP(:,j) =P2_TIP-P2_CMC; %指尖

    v7=P2_MCP-P2_CMC;
    v8=P2_IP-P2_MCP;

    F2=cross(v8,v7);%新系{2}中手指平面法向量
    F2=F2/norm(F2); %归一化，但是只是计算角度的话并没有起到太大作用
    angle_F(j)=asin(F2(1)/norm(F2))/pi*180;%手指自身转角
    j=j+1;
end

gamma_max=max(angle_F)
gamma_min=min(angle_F)