function [Sum] = hassep7(num)
% Topic: Number-Theorie
% Tag:   哈斯图形

if nargin == 0      % 默认为1008
   num = 1008;
end

MEC=('MarkerEdgeColor');        % 图形属性设置
MFC=('MarkerFaceColor');        % 颜色
MS =('MarkerSize');             % 大小

W    = zeros(5,2);              % 初始化操作
K2   = factor(num);
I    = 0;

while K2 ~= 0              % produce table W with factors and exponend
	  I  = I+1;
	  A  = min(K2);
	  B  = max(find(K2 < (A+1)));
	  C  = find(K2 > A);
      K2 = K2(C);
      W(I,:)=[A B];
end

Xhoch=W(1,2)+1;     % X
Yhoch=W(2,2)+1;     % Y
Zhoch=W(3,2)+1;     % Z

X=(1:Xhoch);        % X dimension向量
Y=(1:Yhoch);        % Y dimension向量
Z=(1:Zhoch);        % Z dimension向量
figure(1)
for m =Z                  % 产生网格
    Zx=ones(1,Xhoch);
    Zx=Zx*m;
    K=meshgrid(Y,X);
    for n=Y               % 画线，X方向
        plot3([X],K(:,n),Zx,'-r',[X],K(:,n),Zx,'o',...
              'LineWidth',1.0,MEC,'b',MFC,'b',MS,7); hold on
    end

    Zy=ones(1,Yhoch);
    Zy=Zy*m;
    K=meshgrid(X,Y);
    for n=X               % 画线，Y方向
        plot3(K(:,n),[Y],Zy,'-r',K(:,n),[Y],Zy,'o',...
              'LineWidth',1.0,MEC,'b',MFC,'b',MS,7); hold on
    end
end

for m=Y
    Zz=ones(1,Zhoch);
    Zz=Zz*m;
    K=meshgrid(X,Z);
    for n=X                       % 画线，Z方向
        plot3(K(:,n),Zz,[Z],'-r','LineWidth',1.0); hold on
    end
end

set(gcf,'Color',[1 1 1])          %背景颜色为白色
view(-48,26);
axis equal
axis vis3d
% axis off
xlim([0.5 W(1,2)+1.5])

Dim=length(find(W(:,1)));

r=0;                                        % 标志向量
for h=0:W(5,2)                              % dim = 5
    for k=0:W(4,2)                          % dim = 4
        for l=0:W(3,2)                      % dim z
            for m=0:W(2,2)                  % dim y
                for n=0:W(1,2)              % dim x
                    r = r+1;
                    a = ((W(5,1)^h)*(W(4,1)^k)*W(3,1)^l)*(W(2,1)^m)*(W(1,1)^n);
                    TR(r)=a;
                    if  length(find(W(:,1))) <= 3
                        text(n+1,m+.85,l+1,num2str(a),'FontWeight','bold','Color','k');
                    end
                end
            end
        end
    end
end    

TRS = num2str(sort(TR));
Sum = sum(TR)-num;

if Dim >= 4 
   disp('产出矩阵3D维数')
end

T(1,1)=strcat({'Hasse-Diagram of # '},{num2str(num)});
title(T,'FontSize',9,'Color','b')


