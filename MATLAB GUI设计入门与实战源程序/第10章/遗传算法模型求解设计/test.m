function flag=test(bound,ret)
% lenchrom   input : Ⱦɫ�峤��
% bound      input : ������ȡֵ��Χ
% ret        output: Ⱦɫ��ı���ֵ
x = ret; % �Ƚ���
%����Ⱦɫ��Ŀ�����

if max(ret)<=bound(1,2)&min(ret)>=bound(1,1)
    flag=1;  % ����
else
    flag=0;
end 

  