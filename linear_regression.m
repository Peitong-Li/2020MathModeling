%% ��������⣺��Ԫ���Իع�
% data_first_method---������з���һ����17��������ѵ������300*17
% data_second_method---������з���������15��������ѵ������300*15
% test_data_first---������з���һ����17��������25����������
% test_data_second---������з���������15��������25����������
% y---�����������ֵRON����ʧ
% test_y---���Լ������������ֵRON����ʧ
load data3
%% ��Ԫ���Իع�
clc;
Y = y;
X = [ones(length(Y),1),data_first_method];
test = zeros(length(Y),1)
[b1,bint1,r1,rint1,stats1] = regress(Y,X);
[row,colum] = data_first_method;

sum = 0;  %�ۼ���
for i = 1:row
    for j = 1:colum
        sum = sum + X(i,j) * b1(j);
    end
    test(i) = sum;
end  
% b�Ƿ��̵�ϵ������bint�ǻع�ϵ��������
% r�в�,rint�������䣬stats���ڼ���ع�ģ���Ƿ���ȷ���ֱ���R��ƽ����Fֵ������P
