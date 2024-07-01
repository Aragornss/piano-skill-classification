%% getAngles��������ȡ����ϵ{1}��ʳָ����ָ������ָ��СĴָ���ؽ�ת��
function [ind_angle_CMC,ind_angle_MCP,ind_angle_PIP,ind_angle_DIP,mid_angle_CMC,mid_angle_MCP,mid_angle_PIP,mid_angle_DIP,rin_angle_CMC,rin_angle_MCP,rin_angle_PIP,rin_angle_DIP,lit_angle_CMC,lit_angle_MCP,lit_angle_PIP,lit_angle_DIP]=getAngles(ind_CMC,ind_MCP,ind_PIP,ind_DIP,ind_TIP,mid_CMC,mid_MCP,mid_PIP,mid_DIP,mid_TIP,rin_CMC,rin_MCP,rin_PIP,rin_DIP,rin_TIP,lit_CMC,lit_MCP,lit_PIP,lit_DIP,lit_TIP,p)

for i=1:1:p
    %ʳָָ������
    Dir0_CMC_MCP(:,i) = ind_MCP(:,i) - ind_CMC(:,i);%�ƹ�
    Dir0_MCP_PIP(:,i) = ind_PIP(:,i) - ind_MCP(:,i);%��ָ��
    Dir0_PIP_DIP(:,i) = ind_DIP(:,i) - ind_PIP(:,i);%��ָ��
    Dir0_DIP_TIP(:,i) = ind_TIP(:,i) - ind_DIP(:,i);%Զָ��

    %��ָָ������
    Dir1_CMC_MCP(:,i) = mid_MCP(:,i) - mid_CMC(:,i);%�ƹ�
    Dir1_MCP_PIP(:,i) = mid_PIP(:,i) - mid_MCP(:,i);%��ָ��
    Dir1_PIP_DIP(:,i) = mid_DIP(:,i) - mid_PIP(:,i);%��ָ��
    Dir1_DIP_TIP(:,i) = mid_TIP(:,i) - mid_DIP(:,i);%Զָ��

    %����ָָ������
    Dir2_CMC_MCP(:,i) = rin_MCP(:,i) - rin_CMC(:,i);%�ƹ�
    Dir2_MCP_PIP(:,i) = rin_PIP(:,i) - rin_MCP(:,i);%��ָ��
    Dir2_PIP_DIP(:,i) = rin_DIP(:,i) - rin_PIP(:,i);%��ָ��
    Dir2_DIP_TIP(:,i) = rin_TIP(:,i) - rin_DIP(:,i);%Զָ��
      
    %СĴָָ������
    Dir3_CMC_MCP(:,i) = lit_MCP(:,i) - lit_CMC(:,i);%�ƹ�
    Dir3_MCP_PIP(:,i) = lit_PIP(:,i) - lit_MCP(:,i);%��ָ��
    Dir3_PIP_DIP(:,i) = lit_DIP(:,i) - lit_PIP(:,i);%��ָ��
    Dir3_DIP_TIP(:,i) = lit_TIP(:,i) - lit_DIP(:,i);%Զָ��

    %ʳָCMC����ˮƽ��н�         ��ʽ��⣺arcsin(MCP��ˮƽ��ľ���/CMC��MCP�ľ���)/pi*180
    ind_angle_CMC(i)=asin((ind_MCP(3,i)-ind_CMC(3,i))/ norm(Dir0_CMC_MCP(:,i)) )/pi*180;
    %ʳָMCP��PIP��DIP���н�       ��ʽ��⣺arccos(���������ĵ��/����������ģ�Ļ�)/pi*180
    ind_angle_MCP(i)=acos(dot(Dir0_CMC_MCP(:,i),( Dir0_MCP_PIP(:,i)))/(norm(Dir0_CMC_MCP(:,i))*norm( Dir0_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir0_CMC_MCP(:,i),Dir0_MCP_PIP(:,i));%�����ƹ�����ָ�ڲ�˷������������ڸı�нǵķ�����Ϊ�нǵ�ֵ��0�㸽������acos�������������
    if n(1)>0
        ind_angle_MCP(i) = -ind_angle_MCP(i);
    end
    ind_angle_PIP(i)=acos(dot(Dir0_MCP_PIP(:,i),( Dir0_PIP_DIP(:,i)))/(norm(Dir0_MCP_PIP(:,i))*norm( Dir0_PIP_DIP(:,i))))/pi*180;
    ind_angle_DIP(i)=acos(dot(Dir0_PIP_DIP(:,i),( Dir0_DIP_TIP(:,i)))/(norm(Dir0_PIP_DIP(:,i))*norm( Dir0_DIP_TIP(:,i))))/pi*180;
    
    %��ָCMC����ˮƽ��н�
    mid_angle_CMC(i)=asin((mid_MCP(3,i)-mid_CMC(3,i))/ norm(Dir1_CMC_MCP(:,i)) )/pi*180;
    %��ָMCP��PIP��DIP���н� 
    mid_angle_MCP(i)=acos(dot(Dir1_CMC_MCP(:,i),( Dir1_MCP_PIP(:,i)))/(norm(Dir1_CMC_MCP(:,i))*norm( Dir1_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir1_CMC_MCP(:,i),Dir1_MCP_PIP(:,i));
    if n(1)>0
        mid_angle_MCP(i) = -mid_angle_MCP(i);
    end
    mid_angle_PIP(i)=acos(dot(Dir1_MCP_PIP(:,i),( Dir1_PIP_DIP(:,i)))/(norm(Dir1_MCP_PIP(:,i))*norm( Dir1_PIP_DIP(:,i))))/pi*180;
    mid_angle_DIP(i)=acos(dot(Dir1_PIP_DIP(:,i),( Dir1_DIP_TIP(:,i)))/(norm(Dir1_PIP_DIP(:,i))*norm( Dir1_DIP_TIP(:,i))))/pi*180;

    %����ָCMC����ˮƽ��н�
    rin_angle_CMC(i)=asin((rin_MCP(3,i)-rin_CMC(3,i))/ norm(Dir2_CMC_MCP(:,i)) )/pi*180;
    %����ָMCP��PIP��DIP���н�
    rin_angle_MCP(i)=acos(dot(Dir2_CMC_MCP(:,i),( Dir2_MCP_PIP(:,i)))/(norm(Dir2_CMC_MCP(:,i))*norm( Dir2_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir2_CMC_MCP(:,i),Dir2_MCP_PIP(:,i));
    if n(1)>0
        rin_angle_MCP(i) = -rin_angle_MCP(i);
    end
    rin_angle_PIP(i)=acos(dot(Dir2_MCP_PIP(:,i),( Dir2_PIP_DIP(:,i)))/(norm(Dir2_MCP_PIP(:,i))*norm( Dir2_PIP_DIP(:,i))))/pi*180;
    rin_angle_DIP(i)=acos(dot(Dir2_PIP_DIP(:,i),( Dir2_DIP_TIP(:,i)))/(norm(Dir2_PIP_DIP(:,i))*norm( Dir2_DIP_TIP(:,i))))/pi*180;
        
    %СĴָCMC����ˮƽ��н�
    lit_angle_CMC(i)=asin((lit_MCP(3,i)-lit_CMC(3,i))/ norm(Dir3_CMC_MCP(:,i)) )/pi*180;
    %СĴָMCP��PIP��DIP���н�
    lit_angle_MCP(i)=acos(dot(Dir3_CMC_MCP(:,i),( Dir3_MCP_PIP(:,i)))/(norm(Dir3_CMC_MCP(:,i))*norm( Dir3_MCP_PIP(:,i))))/pi*180;
    n = cross(Dir3_CMC_MCP(:,i),Dir3_MCP_PIP(:,i));
    if n(1)>0
        lit_angle_MCP(i) = -lit_angle_MCP(i);
    end
    lit_angle_PIP(i)=acos(dot(Dir3_MCP_PIP(:,i),( Dir3_PIP_DIP(:,i)))/(norm(Dir3_MCP_PIP(:,i))*norm( Dir3_PIP_DIP(:,i))))/pi*180;
    lit_angle_DIP(i)=acos(dot(Dir3_PIP_DIP(:,i),( Dir3_DIP_TIP(:,i)))/(norm(Dir3_PIP_DIP(:,i))*norm( Dir3_DIP_TIP(:,i))))/pi*180;
end

%%�ֱ��¼ʳָCMC��MCP��PIP��DIP���Ƕ�
% xlswrite(filename,A,xlRange) ������д�빤�����ĵ�һ������������ xlRange ָ���ľ��������ڡ�ʹ�� Excel ��Χ�﷨������ 'A1:C3'��
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

%%�ֱ��¼��ָCMC��MCP��PIP��DIP���Ƕ�
% xlswrite(filename,A,xlRange) ������д�빤�����ĵ�һ������������ xlRange ָ���ľ��������ڡ�ʹ�� Excel ��Χ�﷨������ 'A1:C3'��
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

%%�ֱ��¼����ָCMC��MCP��PIP��DIP���Ƕ�
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

%%�ֱ��¼СĴָCMC��MCP��PIP��DIP���Ƕ�
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

% ֱ�Ӵ����ɵ�excel�ļ��������������
winopen('filename.xls');