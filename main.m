%% 加载数据
% ox325--附件一325个样本原始数据
% x285--285号样本删除0位点后的数据  40*343
% x313--313号样本删除0位点后的数据  40*346
% o285--285号样本附件三的原始数据  40*354
% o313--313号样本附件三的原始数据  40*354
% real285--285号样本附件一的真实数据 1*354
% real313--313号样本附件一的真实数据 1*354
% limit_array--原始变量取值范围矩阵  354*2
load data_one 
%% 问题一求解
% 求不在数据范围的坏值矩阵
clc;
res285_limit = limit(ox285,limit_array);
res313_limit = limit(ox313,limit_array);
% 求不符合3segema准则的坏值矩阵
res285_segema = segema_3(ox285);
res313_segema = segema_3(ox313);
% 求解平均值
res_285 = vector_ave(ox285,res285_limit,res285_segema,0);
res_313 = vector_ave(ox313,res313_limit,res313_segema,0);
% 误差分析: 相对误差 re = (A-B)./B  a是精确解，b是带有误差的解。re是相对误差
res285 = res_285';
res313 = res_313';
real285 = real285';
real313 = real313';
re285 = real285 - res285;
re313 = real313 - res313;

%% 附件一325个样本数据的处理
res325_limit = limit(ox325,limit_array);
res325_segema = segema_3(ox325);
res_325 = vector_ave(ox325,res325_limit,res325_segema,1);


%% 问题五 数据可视化



