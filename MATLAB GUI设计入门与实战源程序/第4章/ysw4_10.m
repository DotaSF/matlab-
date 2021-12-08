clc,clear,close all % 清存
warning off         % 取消警告
feature jit off     % 加速代码执行
x=-8:0.5:8;               % 定义曲面
[XX,YY]=meshgrid(x);
r=sqrt(XX.^2+YY.^2)+eps;
Z=sin(r)./r;
figure('color',[1,1,1])
surf(Z);                   %画出祯
theAxes=axis;              %保存坐标值，使得所有帧都在同一坐标系中
fmat=moviein(20);          %创建一个动画的矩阵，保存20祯
for j=1:30;                %循环创建动画数据
    surf(sin(2*pi*j/20)*Z,Z)      %画出每一步的曲面
    axis(theAxes)                 %使用相同的坐标系
    fmat(:,j)=getframe;           %拷贝祯到矩阵fmat中
end            
% movie(fmat,10)


