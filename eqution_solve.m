function  res = eqution_solve(x,coefficient,c) %���庯��
% �������壺�����Է��̵ĵĽ�
% x: �Ա�������   �ߴ磺�Ա�������*1
% coefficient��ϵ������   �ߴ磺�Ա�������*1
% c��������,����ֵʱΪ0
clc;
res = c; 
colum = length(x);
% �������
for i = 1:colum
    res = res + x(i) * coefficient(i);
end 
