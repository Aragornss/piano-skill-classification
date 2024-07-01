%% readFile函数，读入文件
function [A,p]=readFile()

A=importdata('E:\课题室\动作测量\Motion_measurement\szl_888.txt');%导入数据
A(end,:) = [];  %将最后一行含有无效值的数据删除
p=length(A);    %返回A中最大数组维度的长度

%%
% A=importdata('E:\04-陈番兴\01-动作采集与分析\01-拇指数据采集\Thumb_Chenpanxing\Thumb_Chenpanxing_31.txt');%导入数据
% A(end,:) = [];  %将最后一行含有无效值的数据删除
% p=length(A);    %返回A中最大数组维度的长度
% B = zeros(p,3); %增加3列0数组
% A = [B,A];      %数据补成70列