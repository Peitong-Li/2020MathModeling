function  res2 = limit(x,rangeArray) %���庯��
%�Զ��庯��
%�ű��ļ�:limit.m
%�������ܣ�
% �ú��������������x�г���rangeArray��Χ������
%
% Ӧ��ʾ����
% res =limit(x, rangeArray)
% 
% ���������
% x               ---Ҫ���ı�������
% rangeArray      ---��Χ���󣬵�һ��Ϊ�Ͻ磬�ڶ���Ϊ�½�
% 
% res2: ��x�ߴ��С��ͬ�����ҳ�����Χ��Ԫ�ر��Ϊ1��δ����Χ��Ԫ��λ�ñ��Ϊ0
%% �����С���޷�����
clc;
% ���ش�������ݵ��к���
[row,colum] = size(x);
% ������Χ�ļ�����
flag = 0;
% ���صĽ����ʽ1
res1 = [];
% ���صĽ����ʽ2
res2 = [];

for i=1:row
    for j=1:colum
        % ������Χ�����������
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