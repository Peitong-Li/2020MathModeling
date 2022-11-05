%% 问题三求解：多元线性回归
% data_first_method---问题二中方法一求解的17个变量的训练数据300*17
% data_second_method---问题二中方法二求解的15个变量的训练数据300*15
% test_data_first---问题二中方法一求解的17个变量的25个测试数据
% test_data_second---问题二中方法二求解的15个变量的25个测试数据
% y---因变量：辛烷值RON的损失
% test_y---测试集因变量：辛烷值RON的损失
load data3
%% 多元线性回归
clc;
Y = y;
X = [ones(length(Y),1),data_first_method];
test = zeros(length(Y),1)
[b1,bint1,r1,rint1,stats1] = regress(Y,X);
[row,colum] = data_first_method;

sum = 0;  %累加器
for i = 1:row
    for j = 1:colum
        sum = sum + X(i,j) * b1(j);
    end
    test(i) = sum;
end  
% b是方程的系数矩阵，bint是回归系数的区间
% r残差,rint置信区间，stats用于检验回归模型是否正确，分别是R的平方，F值，概率P
