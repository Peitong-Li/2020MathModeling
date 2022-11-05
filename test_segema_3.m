a = [1;2;3;20000;5;6;7;];

aa=mean(a); %算出a的算数平均值
sig=std(a); %算出a的标准偏差
m=zeros(1,length(a));
i=1;
for t=1:length(a)
m(t)=abs(a(t)-aa);
  if m(t)>=3*sig
  n(t)=aa;
  num(i)=a(t);%显示异常数据
  i=i+1;
else
  n(t)=a(t);
  end
end
b=0:1:length(n)-1;
subplot(2,1,2);
plot(b,n);
title('拉以达法则剔除坏值')
xlabel('采样时间');
ylabel('采样点数')