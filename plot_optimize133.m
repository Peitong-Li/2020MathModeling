%function  res = plot_optimize133(x,coefficient,c) %���庯��
% ����RON����
% compare: S��RON��RON��ʧ��1-93����������
load data5;
clc;

% ��۷����ó������
% ox_ave:325������ƽ��ֵc'le
% coefficient: ���������Իع�ϵ������
% c:���������Իع鳣����
% y_pre:�����Իع���õĸó�ƽ����RON��ʧԤ��ֵ����ʵֵΪ1.254769 
y_pre = eqution_solve(ox_ave,coefficient,c); 
% Ԥ�����ʵ����0.0001
error = y_pre - 1.254769;

%% �����������
close all;clear all;clc;
load data5;
% ȷ����������ʹ�С
start_var = ox133(6:end,1);
end_var = optimize133(6:end,1);
step_direction = ox133 - optimize133;
step_direction = step_direction(6:end,1);
daerta = step(6:end);
% ������¼
move_record = [];
move_record(:,1) = start_var; % ��ʼΪ133��ԭʼ����
% �������
step_direction(:,2) = 0;  % ÿ������ֹͣ���
step_direction(:,3) = daerta;
stop_flag = 1; % ȫ�����Ż��Ľ������ʼֵΪtrue

% ��ʼ����
i = 1;  % ������
while stop_flag
    
    % ��������
    temp_flag = 1;
    for k = 1:length(start_var)
       temp_flag = temp_flag & step_direction(k,2);  %���߼���
    end
    if temp_flag
        stop_flag = 0;
        break;
    end
    % ��¼����
    for k = 1:length(start_var)      
        if abs(step_direction(k,1))>=daerta(k)  % ������ǰ����
            if step_direction(k,1)>0   % ����-����
                move_record(k,i+1) = move_record(k,i) - daerta(k);
                step_direction(k,1) = step_direction(k,1) - daerta(k);
            end
            if step_direction(k,1)<0   % ����+����
                move_record(k,i+1) = move_record(k,i) + daerta(k);
                step_direction(k,1) = step_direction(k,1) + daerta(k);
            end
        else  %������ǰ����         
            move_record(k,i+1) = end_var(k);  %�ñ���������λ��ԭ��̤��
            step_direction(k,2) = 1; %��������
            step_direction(k,1) = 0;
        end
    end
    i = i+1;   %������+1
end

[r,co] = size(move_record);

% ÿ���ı���ֵ
step_var = zeros(length(ox133),co);
% ÿ����������õ���RON��ʧֵ
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
%% �����Ż�ͼ
x = 1:co;
% RON��ʧ���Ż�������ԭ�������ݵĶԱ�
plot(x,y_ron_sunshi,'b*-',x, compare(:,3)','r.:');
title('RON��ʧ���Ż�������ԭ�������ݵĶԱ�');           %���ñ�����
legend('�Ż����̵�RON��ʧֵ','ԭ������RON��ʧ');
xlabel('�Ż��������裨ÿ�����ƶ��ߴ��ڦ���Χ�ڣ�');     %���ú�����
ylabel('�仯ֵ');   %����������
% RON���Ż�������ԭ�������ݵĶԱ�
plot(x,y_ron,'b*-',x, compare(:,2)','r.:');
title('RON���Ż�������ԭ�������ݵĶԱ�');           %���ñ�����
legend('�Ż����̵�RON','ԭ������RON����');
xlabel('�Ż��������裨ÿ�����ƶ��ߴ��ڦ���Χ�ڣ�');     %���ú�����
ylabel('RONֵ');   %����������
% S�������Ż�������ԭ�������ݵĶԱ�
plot(x,y_s,'b*-',x, compare(:,1)','r.:');
title('S�������Ż�������ԭ�������ݵĶԱ�');           %���ñ�����
legend('�Ż����̵�S����','ԭ������S����');
xlabel('�Ż��������裨ÿ�����ƶ��ߴ��ڦ���Χ�ڣ�');     %���ú�����
ylabel('S����ֵ/��g/g');   %����������

x1 = 1:325;
% 325��������S����
plot(x1,s_ron_roncost(:,1),'b*-');
title('325��������S����');           %���ñ�����
legend('S����');
xlabel('����1---325');     %���ú�����
ylabel('S����ֵ/��g/g');   %����������

%325��������RON����
plot(x1,s_ron_roncost(:,2),'b*-');
title('325��������RON����');           %���ñ�����
legend('RON����');
xlabel('����1---325');     %���ú�����
ylabel('RON����');   %����������

%325��������RON��ʧ���
plot(x1,s_ron_roncost(:,3),'b*-');
title('325��������RON��ʧ���');           %���ñ�����
legend('RON��ʧֵ');
xlabel('����1---325');     %���ú�����
ylabel('RON��ʧֵ');   %����������




  




