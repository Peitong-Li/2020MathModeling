function  res = segema_3(x) %定义函数
% 自定义函数
% 脚本文件:segema_3.m
% 函数功能：
% 该函数用来计算矩阵x中含有粗大误差值的坏值
%
% 应用示例：
% res =3segema(x)
% 
% 定义变量：
% x ---要求解的变量矩阵
% 
% res: 与x尺寸大小相同，并且坏值元素标记为1，反之标记为0
%
%返回处理的数据的行和列


%% 拉依达准则（3σ准则）去除异常值
clc;
[row,colum] = size(x);
% 坏值的计数器
flag = 0;
% 返回的结果样式
res = [];
for j = 1:colum
    P = x(:,j);
    ave = mean(P);   % 求xi的算数平均值
    %[h,p]=lillietest(P);    %判断向量是否正态。h=0
    %返回值h为假设,只有0和1两种情况，h=0假设符合正态分布，h=1假设不符合正态分布
    %返回值p为方差概率，也可以说事情的发生概率，p<0.05(显著性水平通常取0.05，还有0.025和0.01三种情况)为不可能事件，拒绝；p>0.05，接受
    segema = std(P);   %求解标准差
    %fprintf('第%d列平均值：%f\n',j,ave);
    %fprintf('第%d列标准差：%f',j,segema);
    for i = 1:row
        if(abs(P(i) - ave) > 3 * segema)
            flag = flag + 1;
            P(i) = 1;
            %disp([num2str(i) '----' num2str(j)]);
        else 
            P(i) = 0;
        end
    end
    res(:,j)=P;
end
