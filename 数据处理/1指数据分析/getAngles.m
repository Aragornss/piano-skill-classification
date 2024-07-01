%% getAngles��������ȡ����ϵ{1}����ָ���ؽ�ת��(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,angle_F)����ָ��б��c��Ĵָƽ����֤��angle
function [angle,c,angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,F]=getAngles(P1_CMC,P1_MCP,P1_IP,P1_TIP,P1_mid_MCP,P1_mid_PIP,L_mid,p)
%% ��ȡ����ϵ{1}����ָ���ؽ�ת��(angle_r_CMC_MCP_XY,angle_r_CMC_MCP_YZ,angle_MCP,angle_IP,angle_F)����ָ��б��c��Ĵָƽ����֤��angle
for i=1:1:p
    %��ָָ������
    Dir1_CMC_MCP(:,i)=P1_MCP(:,i)-P1_CMC(:,i);%����ָ��
    Dir1_MCP_IP(:,i) =P1_IP(:,i) -P1_MCP(:,i);%��ָ��
    Dir1_IP_TIP(:,i) =P1_TIP(:,i)-P1_IP(:,i); %Զָ��
    Dir1_mid(:,i) =P1_mid_PIP(:,i)-P1_mid_MCP(:,i);%��ָ��ָ��
    
    %��ָ��б��
    c(i)=asin((P1_mid_PIP(3,i)-P1_mid_MCP(3,i))/ L_mid(i))/pi*180;
    
    %Ĵָƽ����֤(angle=90�㣬��Ĵָ�������㴦��ͬһƽ����)
    v1=P1_MCP(:,i)-P1_CMC(:,i);
    v2=P1_IP(:,i)-P1_MCP(:,i);
    v3=P1_TIP(:,i)-P1_IP(:,i);
    e1=(cross(v2,v1))';
    e2=v3;
    angle(i)=acos(dot(e1,e2)/(norm(e1)*norm(e2)))/pi*180;
    %��ָƽ�淨����
    F(:,i)=cross(v2,v1);
    
    %Ĵָ�ؽ�ת��
    C1=[1 0 0;0 1 0;0 0 0];
    C2=[0 0 0;0 1 0;0 0 1];
    %{1}ϵ��ĴָMCP�ؽ���XYƽ���ϵ�ͶӰ
    PXY_MCP=C1*P1_MCP(:,i);
    %{1}ϵ��ĴָMCP�ؽ���YZƽ���ϵ�ͶӰ
    PYZ_MCP=C2*P1_MCP(:,i);
    
    %CMC�ؽ���ˮƽ�����ֱ���ڵļн�
    angle_r_CMC_MCP_XY(i)=acos(PXY_MCP(2)/norm(PXY_MCP))/pi*180;
    angle_r_CMC_MCP_YZ(i)=asin(PYZ_MCP(3)/norm(PYZ_MCP))/pi*180;
    %ĴָMCP��IP�ؽڽǶ�
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