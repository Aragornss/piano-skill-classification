%% readFile�����������ļ�
function [A,p]=readFile()

A=importdata('E:\������\��������\Motion_measurement\szl_2_3.txt');%��������
A(end,:) = [];  %�����һ�к�����Чֵ������ɾ��
p=length(A);    %����A���������ά�ȵĳ���
