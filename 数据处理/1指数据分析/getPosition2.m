%% getPosition2��������ȡ����ϵ{2}����ָ����������
function angle_F=getPosition2(P0_CMC,P0_MCP,P0_IP,P0_TIP,p)
%% ��ȡ����ϵ{2}����ָ����������
j=1;
for i=1:1:p
    %%������ָ������ת��
    %�����¶�ϵ{2}
    Dir0_CMC_MCP=P0_MCP(:,i)-P0_CMC(:,i);%��ϵ{0}��CMC-MCPʸ��
    Ey2=Dir0_CMC_MCP/norm(Dir0_CMC_MCP);%Ey2����ָ���غϣ���ָ����ǰ
    Z_z=[0;0;1];%CMC����ֱ���ϵ�����
    Ex2=cross(Ey2,Z_z)/norm(cross(Ey2,Z_z));%Ex2��ˮƽ����ָ��б����ǰ��
    Ez2=cross(Ex2,Ey2)/norm(cross(Ex2,Ey2));%Ez2����ֱƽ���ڣ�ָ��бǰ��
    R3=[Ex2 Ey2 Ez2];   %{2}ϵ��{0}ϵ��ת��
    R4=R3';             %{0}ϵ��{2}ϵ��ת��
    P2_CMC=R4*(P0_CMC(:,i)-P0_CMC(:,i));%������������ϵ{2}�е�����
    P2_MCP=R4*(P0_MCP(:,i)-P0_CMC(:,i));
    P2_IP =R4*(P0_IP(:,i)-P0_CMC(:,i));
    P2_TIP=R4*(P0_TIP(:,i)-P0_CMC(:,i));
    %��ϵ2�и�ָ������
    Dir2_CMC_MCP(:,j)=P2_MCP-P2_CMC;%����ָ��
    Dir2_MCP_IP(:,j) =P2_IP-P2_MCP;%��ָ��
    Dir2_IP_TIP(:,j) =P2_TIP-P2_IP; %Զָ��
    Dir2_CMC_TIP(:,j) =P2_TIP-P2_CMC; %ָ��

    v7=P2_MCP-P2_CMC;
    v8=P2_IP-P2_MCP;

    F2=cross(v8,v7);%��ϵ{2}����ָƽ�淨����
    F2=F2/norm(F2); %��һ��������ֻ�Ǽ���ǶȵĻ���û����̫������
    angle_F(j)=asin(F2(1)/norm(F2))/pi*180;%��ָ����ת��
    j=j+1;
end

gamma_max=max(angle_F)
gamma_min=min(angle_F)