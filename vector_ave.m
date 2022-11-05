function  res = vector_ave(x,limit_array,segema_array,flag_325) %定义函数
%自定义函数
%脚本文件:vector_ave.m
%函数功能：
% 该函数用来计算矩阵x的每列均值
%
% 应用示例：
% res =vector_ave(x, ind_array)
% 
% 定义变量：
% x                  ---要求解的变量矩阵
% limit_array        ---最大最小的限幅索引阵，要求某位置为0
% segema_array       ---3segema索引阵，坏值位置为1
% flag_325           ---是否为325个样本数据的处理标记
% 

%% 计算样品的平均值
[row,colum] = size(x);
res = zeros(row,colum);  %返回的结果
ave_array = zeros(1,colum);
% [ind_row1,ind_colum1] = find(limit_array); %最大最小的限幅索引阵
% [ind_row2,ind_colum2] = find(segema_array);  %3segema索引阵
if flag_325==0  %285或313号样本数据
for j = 1:colum   
    P = x(:,j);  %某一列
    flag = 0;  %某列的坏值计数器
    sum = 0;  %某列非坏值求和器
    for i = 1:row
       if limit_array(i,j) == 1 || segema_array(i,j) == 1
           flag = flag + 1; 
       else
           sum = sum + P(i);
       end
       
    end
    if flag == row
        res(1,j) = mean(P);
    else
        res(1,j) = sum / (row - flag);
    end
end
else   % 325个样本数据
    for j = 1:colum   
        P = x(:,j);  %某一列
        flag = 0;  %某列的坏值计数器
        sum = 0;  %某列非坏值求和器
        for i = 1:row
           if limit_array(i,j) == 1 || segema_array(i,j) == 1
               flag = flag + 1; 
           else
               sum = sum + P(i);
           end
        end
        if flag == row
            ave_array(1,j) = mean(P);
        else
            ave_array(1,j) = sum / (row - flag);
        end
    end
    %对结果矩阵进行赋值
    for j = 1:colum
        for i = 1:row
            %部分值为0的处理，赋值为该列的平均值
            %该处为0且是坏值
            if x(i,j) == 0
                res(i,j) = ave_array(1,j);
            else  %正常值
                res(i,j) = x(i,j);
            end
        end
    end
end





