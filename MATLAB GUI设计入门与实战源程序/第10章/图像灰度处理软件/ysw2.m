clc,clear,close all                    % �������幤�������رմ���
warning off                         % ��������
feature jit off                        % ���ٴ���ִ��
img=imread('231.jpg');
subplot(121),imshow(img),title('ԭʼͼ��')
img_1=img(:,:,1);  % R
img_2=img(:,:,2);  % G
img_3=img(:,:,3);  % B
Y=0.299*img_1+0.587*img_2+0.114*img_3;  % ��ƽ��ϵ��
[m,n]=size(Y);
k=Y(1,1);
for i=1:m
    for j=1:n
        if Y(i,j)>=k    % �жϱȽ�
            k=Y(i,j);
            k1=i;    % ����Ǳ�
            k2=j;    % ����Ǳ�
        end
    end
end
[m1,n1]=find(Y==k);
Rave=sum(sum(img_1));    % ���
Rave=Rave/(m*n);         % ����ϵ��
Gave=sum(sum(img_2));    % ���
Gave=Gave/(m*n);
Bave=sum(sum(img_3));    % ���
Bave=Bave/(m*n);
Kave=(Rave+Gave+Bave)/3;   % ���ֵ
img_1=(Kave/Rave)*img_1;    % �ع�Rͨ��
img_2=(Kave/Gave)*img_2;    % �ع�Gͨ��
img_3=(Kave/Bave)*img_3;    % �ع�Bͨ��
imgysw=cat(3,img_1,img_2,img_3);
subplot(122),imshow(imgysw),title('��ƽ�⴦����')
