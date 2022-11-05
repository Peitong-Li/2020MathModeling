function  res = eqution_solve(x,coefficient,c) %定义函数
% 函数意义：求线性方程的的解
% x: 自变量集合   尺寸：自变量个数*1
% coefficient：系数集合   尺寸：自变量个数*1
% c：常数项,不赋值时为0
clc;
res = c; 
colum = length(x);
% 线性求和
for i = 1:colum
    res = res + x(i) * coefficient(i);
end 
