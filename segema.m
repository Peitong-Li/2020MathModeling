function  res = segema(x) %定义函数


%%求segema
da = std(x)
ave = mean(x);
fprintf('平均值：%f',ave);
v = x - ave
vi2 = v.*v
sum_vi2 = 0;
for i = 1:length(x)
   vi2(i)
   sum_vi2 = sum_vi2 + vi2(i);
end
fprintf('sum_vi2：%f\n',sum_vi2);
res = sqrt(sum_vi2/(length(x)-1));
