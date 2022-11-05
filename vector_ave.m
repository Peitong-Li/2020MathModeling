function  res = vector_ave(x,limit_array,segema_array,flag_325) %���庯��
%�Զ��庯��
%�ű��ļ�:vector_ave.m
%�������ܣ�
% �ú��������������x��ÿ�о�ֵ
%
% Ӧ��ʾ����
% res =vector_ave(x, ind_array)
% 
% ���������
% x                  ---Ҫ���ı�������
% limit_array        ---�����С���޷�������Ҫ��ĳλ��Ϊ0
% segema_array       ---3segema�����󣬻�ֵλ��Ϊ1
% flag_325           ---�Ƿ�Ϊ325���������ݵĴ�����
% 

%% ������Ʒ��ƽ��ֵ
[row,colum] = size(x);
res = zeros(row,colum);  %���صĽ��
ave_array = zeros(1,colum);
% [ind_row1,ind_colum1] = find(limit_array); %�����С���޷�������
% [ind_row2,ind_colum2] = find(segema_array);  %3segema������
if flag_325==0  %285��313����������
for j = 1:colum   
    P = x(:,j);  %ĳһ��
    flag = 0;  %ĳ�еĻ�ֵ������
    sum = 0;  %ĳ�зǻ�ֵ�����
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
else   % 325����������
    for j = 1:colum   
        P = x(:,j);  %ĳһ��
        flag = 0;  %ĳ�еĻ�ֵ������
        sum = 0;  %ĳ�зǻ�ֵ�����
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
    %�Խ��������и�ֵ
    for j = 1:colum
        for i = 1:row
            %����ֵΪ0�Ĵ�����ֵΪ���е�ƽ��ֵ
            %�ô�Ϊ0���ǻ�ֵ
            if x(i,j) == 0
                res(i,j) = ave_array(1,j);
            else  %����ֵ
                res(i,j) = x(i,j);
            end
        end
    end
end





