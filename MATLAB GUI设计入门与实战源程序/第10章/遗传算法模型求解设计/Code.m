function ret=Code(lenchrom,bound)
%�����������������Ⱦɫ�壬���������ʼ��һ����Ⱥ
% lenchrom   input : Ⱦɫ�峤��
% bound      input : ������ȡֵ��Χ
% ret        output: Ⱦɫ��ı���ֵ
flag=0;
while flag==0     
    for i=1:lenchrom   % ���ÿһ�����������ȡֵ
        pick = rand*(bound(i,2)-bound(i,1)+1);
        ret(i) = bound(i,1) + pick -1; %���Բ�ֵ����������ʵ����������ret��
    end
    %����Ⱦɫ��Ŀ�����
    flag=test(bound,ret);
end
        
