%% ��������
% ox325--����һ325������ԭʼ����
% x285--285������ɾ��0λ��������  40*343
% x313--313������ɾ��0λ��������  40*346
% o285--285��������������ԭʼ����  40*354
% o313--313��������������ԭʼ����  40*354
% real285--285����������һ����ʵ���� 1*354
% real313--313����������һ����ʵ���� 1*354
% limit_array--ԭʼ����ȡֵ��Χ����  354*2
load data_one 
%% ����һ���
% �������ݷ�Χ�Ļ�ֵ����
clc;
res285_limit = limit(ox285,limit_array);
res313_limit = limit(ox313,limit_array);
% �󲻷���3segema׼��Ļ�ֵ����
res285_segema = segema_3(ox285);
res313_segema = segema_3(ox313);
% ���ƽ��ֵ
res_285 = vector_ave(ox285,res285_limit,res285_segema,0);
res_313 = vector_ave(ox313,res313_limit,res313_segema,0);
% ������: ������ re = (A-B)./B  a�Ǿ�ȷ�⣬b�Ǵ������Ľ⡣re��������
res285 = res_285';
res313 = res_313';
real285 = real285';
real313 = real313';
re285 = real285 - res285;
re313 = real313 - res313;

%% ����һ325���������ݵĴ���
res325_limit = limit(ox325,limit_array);
res325_segema = segema_3(ox325);
res_325 = vector_ave(ox325,res325_limit,res325_segema,1);


%% ������ ���ݿ��ӻ�



