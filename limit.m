function  res2 = limit(x,rangeArray) %定义函数
%自定义函数
%脚本文件:limit.m
%函数功能：
% 该函数用来计算矩阵x中超出rangeArray范围的索引
%
% 应用示例：
% res =limit(x, rangeArray)
% 
% 定义变量：
% x               ---要求解的变量矩阵
% rangeArray      ---范围矩阵，第一列为上界，第二列为下界
% 
% res2: 与x尺寸大小相同，并且超过范围的元素标记为1，未超范围的元素位置标记为0
%% 最大最小的限幅方法
clc;
% 返回处理的数据的行和列
[row,colum] = size(x);
% 超出范围的计数器
flag = 0;
% 返回的结果样式1
res1 = [];
% 返回的结果样式2
res2 = [];

for i=1:row
    for j=1:colum
        % 超出范围的情况做处理
        if (x(i,j)>rangeArray(j,2)||x(i,j)<rangeArray(j,1))
            % disp([num2str(i) '----' num2str(j)]);
            flag = flag + 1;
            res1(flag,1) = i;
            res1(flag,2) = j;
            res2(i,j) = 1;
        else
            res2(i,j) = 0;
        end
    end
end
[row1,colum1] = size(res2);