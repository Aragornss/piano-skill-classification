%% readFile�����������ļ�
function [A,p]=readFile()

A=importdata('E:\������\��������\Motion_measurement\szl_888.txt');%��������
A(end,:) = [];  %�����һ�к�����Чֵ������ɾ��
p=length(A);    %����A���������ά�ȵĳ���

%%
% A=importdata('E:\04-�·���\01-�����ɼ������\01-Ĵָ���ݲɼ�\Thumb_Chenpanxing\Thumb_Chenpanxing_31.txt');%��������
% A(end,:) = [];  %�����һ�к�����Чֵ������ɾ��
% p=length(A);    %����A���������ά�ȵĳ���
% B = zeros(p,3); %����3��0����
% A = [B,A];      %���ݲ���70��