%% getOC函数，获取2、3、4、5指特征点原始坐标数据(分别为："CMC"、MCP、PIP、DIP、TIP)
function [P0_ind_CMC,P0_ind_MCP,P0_ind_PIP,P0_ind_DIP,P0_ind_TIP,P0_mid_CMC,P0_mid_MCP,P0_mid_PIP,P0_mid_DIP,P0_mid_TIP,P0_Ring_CMC,P0_Ring_MCP,P0_Ring_PIP,P0_Ring_DIP,P0_Ring_TIP,P0_Little_CMC,P0_Little_MCP,P0_Little_PIP,P0_Little_DIP,P0_Little_TIP]=getOC(A)
%% 获取食指特征点原始坐标数据(分别为："CMC"、MCP、PIP、DIP、TIP)
x10=A(:,78);%食指"CMC"关节坐标
y10=-A(:,79);
z10=A(:,80);
x11=A(:,16);%食指MCP关节坐标
y11=-A(:,17);
z11=A(:,18);
x12=A(:,19);%食指PIP关节坐标
y12=-A(:,20);
z12=A(:,21);
x13=A(:,22);%食指DIP关节坐标
y13=-A(:,23);
z13=A(:,24);
x14=A(:,25);%食指TIP关节坐标
y14=-A(:,26);
z14=A(:,27);

%% 获取中指特征点原始坐标数据(分别为："CMC"、MCP、PIP、DIP、TIP)
x20=A(:,81);%中指"CMC"关节坐标
y20=-A(:,82);
z20=A(:,83);
x21=A(:,28);%中指MCP关节坐标
y21=-A(:,29);
z21=A(:,30);
x22=A(:,31);%中指PIP关节坐标
y22=-A(:,32);
z22=A(:,33);
x23=A(:,34);%中指DIP关节坐标
y23=-A(:,35);
z23=A(:,36);
x24=A(:,37);%中指TIP关节坐标
y24=-A(:,38);
z24=A(:,39);

%% 获取无名指特征点原始坐标数据(分别为："CMC"、MCP、PIP、DIP、TIP)
x30=A(:,84);%无名指"CMC"关节坐标
y30=-A(:,85);
z30=A(:,86);
x31=A(:,40);%无名指MCP关节坐标
y31=-A(:,41);
z31=A(:,42);
x32=A(:,43);%无名指PIP关节坐标
y32=-A(:,44);
z32=A(:,45);
x33=A(:,46);%无名指DIP关节坐标
y33=-A(:,47);
z33=A(:,48);
x34=A(:,49);%无名指TIP关节坐标
y34=-A(:,50);
z34=A(:,51);

%% 获取小拇指特征点原始坐标数据(分别为："CMC"、MCP、PIP、DIP、TIP)
x40=A(:,87);%小拇指"CMC"关节坐标
y40=-A(:,88);
z40=A(:,89);
x41=A(:,52);%小拇指MCP关节坐标
y41=-A(:,53);
z41=A(:,54);
x42=A(:,55);%小拇指PIP关节坐标
y42=-A(:,56);
z42=A(:,57);
x43=A(:,58);%小拇指DIP关节坐标
y43=-A(:,59);
z43=A(:,60);
x44=A(:,61);%小拇指TIP关节坐标
y44=-A(:,62);
z44=A(:,63);

%% 原始坐标系下食指特征点坐标
P0_ind_CMC=[x10'; y10'; z10'];
P0_ind_MCP=[x11'; y11'; z11'];
P0_ind_PIP=[x12'; y12'; z12'];
P0_ind_DIP=[x13'; y13'; z13'];
P0_ind_TIP=[x14'; y14'; z14'];

%% 原始坐标系下中指特征点坐标
P0_mid_CMC=[x20'; y20'; z20'];
P0_mid_MCP=[x21'; y21'; z21'];
P0_mid_PIP=[x22'; y22'; z22'];
P0_mid_DIP=[x23'; y23'; z23'];
P0_mid_TIP=[x24'; y24'; z24'];

%% 原始坐标系下无名指特征点坐标
P0_Ring_CMC=[x30'; y30'; z30'];
P0_Ring_MCP=[x31'; y31'; z31'];
P0_Ring_PIP=[x32'; y32'; z32'];
P0_Ring_DIP=[x33'; y33'; z33'];
P0_Ring_TIP=[x34'; y34'; z34'];

%% 原始坐标系下小拇指特征点坐标
P0_Little_CMC=[x40'; y40'; z40'];
P0_Little_MCP=[x41'; y41'; z41'];
P0_Little_PIP=[x42'; y42'; z42'];
P0_Little_DIP=[x43'; y43'; z43'];
P0_Little_TIP=[x44'; y44'; z44'];