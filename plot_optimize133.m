%function  res = plot_optimize133(x,coefficient,c) %定义函数
% 绘制RON曲线
% compare: S，RON，RON损失的1-93个样本数据
load data5;
clc;

% 宏观分析该厂的情况
% ox_ave:325个样本平均值c'le
% coefficient: 方法二线性回归系数向量
% c:方法二线性回归常数项
% y_pre:用线性回归求得的该厂平均的RON损失预测值，真实值为1.254769 
y_pre = eqution_solve(ox_ave,coefficient,c); 
% 预测和真实的误差：0.0001
error = y_pre - 1.254769;

%% 计算操作步骤
close all;clear all;clc;
load data5;
% 确定步长方向和大小
start_var = ox133(6:end,1);
end_var = optimize133(6:end,1);
step_direction = ox133 - optimize133;
step_direction = step_direction(6:end,1);
daerta = step(6:end);
% 操作记录
move_record = [];
move_record(:,1) = start_var; % 初始为133的原始数据
% 结束标记
step_direction(:,2) = 0;  % 每个变量停止标记
step_direction(:,3) = daerta;
stop_flag = 1; % 全部到优化的结果，初始值为true

% 开始操纵
i = 1;  % 计数器
while stop_flag
    
    % 结束检验
    temp_flag = 1;
    for k = 1:length(start_var)
       temp_flag = temp_flag & step_direction(k,2);  %做逻辑与
    end
    if temp_flag
        stop_flag = 0;
        break;
    end
    % 记录操作
    for k = 1:length(start_var)      
        if abs(step_direction(k,1))>=daerta(k)  % 还能往前迈步
            if step_direction(k,1)>0   % 负向-操作
                move_record(k,i+1) = move_record(k,i) - daerta(k);
                step_direction(k,1) = step_direction(k,1) - daerta(k);
            end
            if step_direction(k,1)<0   % 正向+操作
                move_record(k,i+1) = move_record(k,i) + daerta(k);
                step_direction(k,1) = step_direction(k,1) + daerta(k);
            end
        else  %不能往前迈步         
            move_record(k,i+1) = end_var(k);  %让变量在最优位置原地踏步
            step_direction(k,2) = 1; %不能迈步
            step_direction(k,1) = 0;
        end
    end
    i = i+1;   %计数器+1
end

[r,co] = size(move_record);

% 每步的变量值
step_var = zeros(length(ox133),co);
% 每步变量计算得到的RON损失值
y_ron_sunshi = zeros(1,93);
y_ron = zeros(1,93);
y_s = zeros(1,93);
for j = 1:co
    step_var(1:5,j) = ox133(1:5);
    step_var(6:end,j) = move_record(:,j);
end
for j = 1:co
    y_ron_sunshi(1,j) = eqution_solve(step_var(:,j),coefficient,c);
    y_ron(1,j) = eqution_solve(step_var(:,j),ron_coefficient,ron_c);
    y_s(1,j) = eqution_solve(step_var(:,j),s_coefficient,s_c);
end
%% 绘制优化图
x = 1:co;
% RON损失的优化过程与原样本数据的对比
plot(x,y_ron_sunshi,'b*-',x, compare(:,3)','r.:');
title('RON损失的优化过程与原样本数据的对比');           %设置标题行
legend('优化过程的RON损失值','原样本的RON损失');
xlabel('优化操作步骤（每步的移动尺寸在Δ范围内）');     %设置横坐标
ylabel('变化值');   %设置纵坐标
% RON的优化过程与原样本数据的对比
plot(x,y_ron,'b*-',x, compare(:,2)','r.:');
title('RON的优化过程与原样本数据的对比');           %设置标题行
legend('优化过程的RON','原样本的RON含量');
xlabel('优化操作步骤（每步的移动尺寸在Δ范围内）');     %设置横坐标
ylabel('RON值');   %设置纵坐标
% S含量的优化过程与原样本数据的对比
plot(x,y_s,'b*-',x, compare(:,1)','r.:');
title('S含量的优化过程与原样本数据的对比');           %设置标题行
legend('优化过程的S含量','原样本的S含量');
xlabel('优化操作步骤（每步的移动尺寸在Δ范围内）');     %设置横坐标
ylabel('S含量值/μg/g');   %设置纵坐标

x1 = 1:325;
% 325个样本的S含量
plot(x1,s_ron_roncost(:,1),'b*-');
title('325个样本的S含量');           %设置标题行
legend('S含量');
xlabel('样本1---325');     %设置横坐标
ylabel('S含量值/μg/g');   %设置纵坐标

%325个样本的RON含量
plot(x1,s_ron_roncost(:,2),'b*-');
title('325个样本的RON含量');           %设置标题行
legend('RON含量');
xlabel('样本1---325');     %设置横坐标
ylabel('RON含量');   %设置纵坐标

%325个样本的RON损失情况
plot(x1,s_ron_roncost(:,3),'b*-');
title('325个样本的RON损失情况');           %设置标题行
legend('RON损失值');
xlabel('样本1---325');     %设置横坐标
ylabel('RON损失值');   %设置纵坐标




  




