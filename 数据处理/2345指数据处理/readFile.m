%% readFile函数，读入文件
function [A,p]=readFile()

A=importdata('E:\课题室\动作测量\Motion_measurement\szl_2_3.txt');%导入数据
A(end,:) = [];  %将最后一行含有无效值的数据删除
p=length(A);    %返回A中最大数组维度的长度
