a = [1;2;3;20000;5;6;7;];

aa=mean(a); %���a������ƽ��ֵ
sig=std(a); %���a�ı�׼ƫ��
m=zeros(1,length(a));
i=1;
for t=1:length(a)
m(t)=abs(a(t)-aa);
  if m(t)>=3*sig
  n(t)=aa;
  num(i)=a(t);%��ʾ�쳣����
  i=i+1;
else
  n(t)=a(t);
  end
end
b=0:1:length(n)-1;
subplot(2,1,2);
plot(b,n);
title('���Դ﷨���޳���ֵ')
xlabel('����ʱ��');
ylabel('��������')