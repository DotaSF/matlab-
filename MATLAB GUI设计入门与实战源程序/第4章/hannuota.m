%汉诺塔游戏攻略 动画演示
% 汗诺塔游戏算法:
%     把最左边竖干从大到小叠放在一起的木块移动到最右边竖干上（木块越多算法越复杂）,
% 并要求：
% 1) 每次只许移动一块木块.
% 2）在移动过程中要始终保持小的木块在大的木块之上。
% 3）而且移动工程中不能出现碰撞的情况.
hf=figure('name','汉诺塔游戏仿真');    %加标题
axis([0,12,0,12]);     %画坐标
set(hf,'color','w');       %填充背景
hold on;       %保持图形
axis('off');       %隐藏网络线
rectangle('position',[0,0,12,0.5],'FaceColor',[0,1.0,0]);    %画底版
line([3;3],[0.5,8],'color','r','linestyle','-','linewidth',1.5);
line([6;6],[0.5,8],'color','r','linestyle','-','linewidth',1.5);
line([9;9],[0.5,8],'color','r','linestyle','-','linewidth',1.5);    %画出三条路线
a=line([3;3],[0.5,1.0],'color','c','linestyle','-','linewidth',65); %画出一号长方体木块
b=line([3;3],[1.0,1.5],'color','b','linestyle','-','linewidth',45);%画出二号长方体木块
c=line([3;3],[1.5,2.0],'color','k','linestyle','-','linewidth',30); %画出三号长方体木块
d=line([3;3],[2.0,2.5],'color','y','linestyle','-','linewidth',25);%画出四号长方体木块
e=line([3;3],[2.5,3.0],'color','m','linestyle','-','linewidth',15);%画出五号长方体木块

%设置五木板的运动
%设置五号长方体木块的运动，竖直向上运动到第一条路线的最上方
t1=2.5;  dt=0.05;
while t1<=8
    t1=t1+dt;
    set(e,'xdata',[3;3],'ydata',[t1;t1+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第三条路线的最上方
t2=3;   dt=0.05;
while t2<=9
    t2=t2+dt;
    set(e,'xdata',[t2;t2],'ydata',[t1;t1+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的下方    
t3=8;   dt=0.05;
while t3>=0.5
    t3=t3-dt;
    set(e,'xdata',[9;9],'ydata',[t3;t3+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end          
%设置四号长方体木块的运动，竖直向上运动到第一条路线的最上方
t4=2.0;   dt=0.05;
while t4<=8
    t4=t4+dt;
    set(d,'xdata',[3;3],'ydata',[t4;t4+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置四号长方体木块的运动，水平运动到第二条路线的最上方
t5=3;   dt=0.05;
while t5<=6
    t5=t5+dt;
    set(d,'xdata',[t5;t5],'ydata',[t4;t4+0.5]);
    drawnow;    set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置四号长方体木块的运动，竖直向下运动到第二条路线的最下方      
t6=8;   dt=0.05;
while t6>=0.5
    t6=t6-dt;
    set(d,'xdata',[6;6],'ydata',[t6;t6+0.5]);
    drawnow; 
set(gcf,'doublebuffer','on');    %消除震动
end       
%设置五号长方体木块的运动，竖直向上运动到第三条路线的最上方
t7=0.5;   dt=0.05;
while t7<=8
    t7=t7+dt;
    set(e,'xdata',[9;9],'ydata',[t7;t7+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，水平运动到第二条路线的最上方  
t8=9;   dt=0.05;
while t8>=6
    t8=t8-dt;
    set(e,'xdata',[t8;t8],'ydata',[t7;t7+0.5]);
    drawnow;     
set(gcf,'doublebuffer','on');    %消除震动
end        
% 设置五号长方体木块的运动，竖直向下运动到第二条路线的下方  
t9=8;    dt=0.05;
while t9>=1.0
    t9=t9-dt;
    set(e,'xdata',[6;6],'ydata',[t9;t9+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置三号长方体木块的运动，竖直向上运动到第一条路线的上方
t10=1.5;    dt=0.05;
while t10<=8
    t10=t10+dt;
    set(c,'xdata',[3;3],'ydata',[t10;t10+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end        
% 设置三号长方体木块的运动，水平运动到第三条路线的上方
t11=3;    dt=0.05;
while t11<=9
    t11=t11+dt;
    set(c,'xdata',[t11;t11],'ydata',[t10;t10+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end        
  % 设置三号长方体木块的运动，竖直向下运动到第三条路线的下方
t12=8;    dt=0.05;
while t12>=0.5
    t12=t12-dt;
    set(c,'xdata',[9;9],'ydata',[t12;t12+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向上运动到第二条路线的上方   
t13=1;   dt=0.05;
while t13<=8
    t13=t13+dt;
    set(e,'xdata',[6;6],'ydata',[t13;t13+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end     
% 设置五号长方体木块的运动，水平运动到第一条路线的最上方   
t14=6;   dt=0.05;
while t14>=3
    t14=t14-dt;
    set(e,'xdata',[t14;t14],'ydata',[8;8+0.5]);
    drawnow;
   set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置五号长方体木块的运动，竖直向下运动到第一条路线的下方
t15=8;   dt=0.05;
while t15>=1.5
    t15=t15-dt;
    set(e,'xdata',[3;3],'ydata',[t15;t15+0.5]);
    drawnow;
  set(gcf,'doublebuffer','on');    %消除震动
end     
% 设置四号长方体木块的运动，竖直向上运动到第二条路线的上方    
t16=0.5;  dt=0.05;
while t16<=8
    t16=t16+dt;
    set(d,'xdata',[6;6],'ydata',[t16;t16+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置四号长方体木块的运动，水平运动到第三条路线的上方
t17=6;   dt=0.05;
while t17<=9
    t17=t17+dt;
    set(d,'xdata',[t17;t17],'ydata',[8;8.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置四号长方体木块的运动，竖直向下运动到第三条路线的下方    
t18=8;dt=0.05;
while t18>=1
    t18=t18-dt;
    set(d,'xdata',[9;9],'ydata',[t18;t18+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end         
% 设置五号长方体木块的运动，竖直向上运动到第一条路线的上方
t19=1.0;dt=0.05;
while t19<=8
    t19=t19+dt;
    set(e,'xdata',[3;3],'ydata',[t19;t19+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end         
  % 设置五号长方体木块的运动，水平运动到第三条路线的上方
t20=3;dt=0.05;
while t20<=9
    t20=t20+dt;
    set(e,'xdata',[t20;t20],'ydata',[8;8.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的下方
t21=8; dt=0.05;
while t21>=1.5
    t21=t21-dt;
    set(e,'xdata',[9;9],'ydata',[t21;t21+0.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %消除震动
end  
% 设置二号长方体木块的运动，竖直向上运动到第一条路线的上方
t22=1.0;  dt=0.05;
while t22<=8
    t22=t22+dt;
    set(b,'xdata',[3;3],'ydata',[t22;t22+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
% 设置二号长方体木块的运动，水平运动到第二条路线的上方
t23=3;   dt=0.05;
while t23<=6
    t23=t23+dt;
    set(b,'xdata',[t23;t23],'ydata',[t22;t22+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置二号长方体木块的运动，竖直向下运动到第二条路线的最下方    
t24=8;   dt=0.05;
while t24>=0.5
    t24=t24-dt;
    set(b,'xdata',[6;6],'ydata',[t24;t24+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end        
% 设置五号长方体木块的运动，竖直向上运动到第三条路线的上方
t25=1.5;  dt=0.05;
while t25<=8
    t25=t25+dt;
    set(e,'xdata',[9;9],'ydata',[t25;t25+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
% 设置五号长方体木块的运动，水平运动到第二条路线的上方
t26=9;   dt=0.05;
while t26>=6
    t26=t26-dt;
    set(e,'xdata',[t26;t26],'ydata',[t25;t25+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第二条路线的下方    
t27=8;   dt=0.05;
while t27>=1.0
    t27=t27-dt;
    set(e,'xdata',[6;6],'ydata',[t27;t27+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置四号长方体木块的运动，竖直向上运动到第三条路线的上方
t28=1.5;  dt=0.05;
while t28<=8
    t28=t28+dt;
    set(d,'xdata',[9;9],'ydata',[t28;t28+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end
% 设置四号长方体木块的运动，水平运动到第一条路线的上方
t29=9;   dt=0.05;
while t29>=3
    t29=t29-dt;
    set(d,'xdata',[t29;t29],'ydata',[t28;t28+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置四号长方体木块的运动，竖直向下运动到第一条路线的下方    
t30=8;   dt=0.05;
while t30>=1.0
    t30=t30-dt;
    set(d,'xdata',[3;3],'ydata',[t30;t30+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置五号长方体木块的运动，竖直向上运动到第二条路线的上方
t31=1.0;  dt=0.05;
while t31<=8
    t31=t31+dt;
    set(e,'xdata',[6;6],'ydata',[t31;t31+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
% 设置五号长方体木块的运动，水平运动到第一条路线的上方
t32=6;   dt=0.05;
while t32>=3
    t32=t32-dt;
    set(e,'xdata',[t32;t32],'ydata',[t31;t31+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第一条路线的下方    
t33=8;   dt=0.05;
while t33>=1.5
    t33=t33-dt;
    set(e,'xdata',[3;3],'ydata',[t33;t33+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置三号长方体木块的运动，竖直向上运动到第三条路线的上方
t34=0.5;  dt=0.05;
while t34<=8
    t34=t34+dt;
    set(c,'xdata',[9;9],'ydata',[t34;t34+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
% 设置三号长方体木块的运动，水平运动到第二条路线的上方
t35=9;   dt=0.05;
while t35>=6
    t35=t35-dt;
    set(c,'xdata',[t35;t35],'ydata',[t34;t34+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置三号长方体木块的运动，竖直向下运动到第二条路线的下方    
t36=8;   dt=0.05;
while t36>=1.0
    t36=t36-dt;
    set(c,'xdata',[6;6],'ydata',[t36;t36+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向上运动到第三条路线的上方
t37=1.5;  dt=0.05;
while t37<=8
    t37=t37+dt;
    set(e,'xdata',[3;3],'ydata',[t37;t37+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第三条路线的最上方
t38=3;   dt=0.05;
while t38<=9
    t38=t38+dt;
    set(e,'xdata',[t38;t38],'ydata',[t37;t37+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的下方    
t39=8;   dt=0.05;
while t39>=0.5
    t39=t39-dt;
    set(e,'xdata',[9;9],'ydata',[t39;t39+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置四号长方体木块的运动，竖直向上运动到第二条路线的上方
t40=2.5;  dt=0.05;
while t40<=8
    t40=t40+dt;
    set(d,'xdata',[3;3],'ydata',[t40;t40+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置四号长方体木块的运动，水平运动到第二条路线的最上方
t41=3;   dt=0.05;
while t41<=6
    t41=t41+dt;
    set(d,'xdata',[t41;t41],'ydata',[t40;t40+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置四号长方体木块的运动，竖直向下运动到第二条路线的下方    
t42=8;   dt=0.05;
while t42>=1.5
    t42=t42-dt;
    set(d,'xdata',[6;6],'ydata',[t42;t42+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置五号长方体木块的运动，竖直向上运动到第三条路线的上方
t43=0.5;  dt=0.05;
while t43<=8
    t43=t43+dt;
    set(e,'xdata',[9;9],'ydata',[t43;t43+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第二条路线的最上方
t44=9;   dt=0.05;
while t44>=6
    t44=t44-dt;
    set(e,'xdata',[t44;t44],'ydata',[t43;t43+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第二条路线的下方    
t45=8;   dt=0.05;
while t45>=2.0
    t45=t45-dt;
    set(e,'xdata',[6;6],'ydata',[t45;t45+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end   
% 设置一号长方体木块的运动，竖直向上运动到第一条路线的上方
t46=0.5;  dt=0.05;
while t46<=8
    t46=t46+dt;
    set(a,'xdata',[3;3],'ydata',[t46;t46+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置一号长方体木块的运动，水平运动到第三条路线的最上方
t47=3;   dt=0.05;
while t47<=9
    t47=t47+dt;
    set(a,'xdata',[t47;t47],'ydata',[t46;t46+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置一号长方体木块的运动，竖直向下运动到第三条路线的最下方    
t48=8;   dt=0.05;
while t48>=0.5
    t48=t48-dt;
    set(a,'xdata',[9;9],'ydata',[t48;t48+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向上运动到第二条路线的上方
t49=2.0;  dt=0.05;
while t49<=8
    t49=t49+dt;
    set(e,'xdata',[6;6],'ydata',[t49;t49+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第一条路线的最上方
t50=6;   dt=0.05;
while t50>=3
    t50=t50-dt;
    set(e,'xdata',[t50;t50],'ydata',[t49;t49+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第一条路线的最下方    
t51=8;   dt=0.05;
while t51>=0.5
    t51=t51-dt;
    set(e,'xdata',[3;3],'ydata',[t51;t51+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置四号长方体木块的运动，竖直向上运动到第二条路线的上方
t52=1.5;  dt=0.05;
while t52<=8
    t52=t52+dt;
    set(d,'xdata',[6;6],'ydata',[t52;t52+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置四号长方体木块的运动，水平运动到第三条路线的最上方
t53=6;   dt=0.05;
while t53<=9
    t53=t53+dt;
    set(d,'xdata',[t53;t53],'ydata',[t52;t52+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置四号长方体木块的运动，竖直向下运动到第三条路线的下方    
t54=8;   dt=0.05;
while t54>=1.0
    t54=t54-dt;
    set(d,'xdata',[9;9],'ydata',[t54;t54+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置五号长方体木块的运动，竖直向上运动到第一条路线的上方
t55=0.5;  dt=0.05;
while t55<=8
    t55=t55+dt;
    set(e,'xdata',[3;3],'ydata',[t55;t55+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第三条路线的最上方
t56=3;   dt=0.05;
while t56<=9
    t56=t56+dt;
    set(e,'xdata',[t56;t56],'ydata',[t55;t55+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的下方    
t57=8;   dt=0.05;
while t57>=1.5
    t57=t57-dt;
    set(e,'xdata',[9;9],'ydata',[t57;t57+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置三号长方体木块的运动，竖直向上运动到第二条路线的最上方
t58=1.0;  dt=0.05;
while t58<=8
    t58=t58+dt;
    set(c,'xdata',[6;6],'ydata',[t58;t58+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置三号长方体木块的运动，水平运动到第一条路线的最上方
t59=6;   dt=0.05;
while t59>=3
    t59=t59-dt;
    set(c,'xdata',[t59;t59],'ydata',[t58;t58+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置三号长方体木块的运动，竖直向下运动到第一条路线的最下方    
t60=8;   dt=0.05;
while t60>=0.5
    t60=t60-dt;
    set(c,'xdata',[3;3],'ydata',[t60;t60+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置五号长方体木块的运动，竖直向上运动到第三条路线的上方
t61=1.5;  dt=0.05;
while t61<=8
    t61=t61+dt;
    set(e,'xdata',[9;9],'ydata',[t61;t61+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第二条路线的最上方
t62=9;   dt=0.05;
while t62>=6
    t62=t62-dt;
    set(e,'xdata',[t62;t62],'ydata',[t61;t61+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第二条路线的下方    
t63=8;   dt=0.05;
while t63>=1.0
    t63=t63-dt;
    set(e,'xdata',[6;6],'ydata',[t63;t63+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置四号长方体木块的运动，竖直向上运动到第三条路线的最上方
t64=1.0;  dt=0.05;
while t64<=8
    t64=t64+dt;
    set(d,'xdata',[9;9],'ydata',[t64;t64+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置四号长方体木块的运动，水平运动到第一条路线的最上方
t65=9;   dt=0.05;
while t65>=3
    t65=t65-dt;
    set(d,'xdata',[t65;t65],'ydata',[t64;t64+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置四号长方体木块的运动，竖直向下运动到第一条路线的下方    
t66=8;   dt=0.05;
while t66>=1.0
    t66=t66-dt;
    set(d,'xdata',[3;3],'ydata',[t66;t66+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end
% 设置五号长方体木块的运动，竖直向上运动到第二条路线的最上方
t67=1.0;  dt=0.05;
while t67<=8
    t67=t67+dt;
    set(e,'xdata',[6;6],'ydata',[t67;t67+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第一条路线的最上方
t68=6;   dt=0.05;
while t68>=3
    t68=t68-dt;
    set(e,'xdata',[t68;t68],'ydata',[t67;t67+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第一条路线的下方    
t69=8;   dt=0.05;
while t69>=1.5
    t69=t69-dt;
    set(e,'xdata',[3;3],'ydata',[t69;t69+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end
% 设置二号长方体木块的运动，竖直向上运动到第二条路线的上方
t70=0.5;  dt=0.05;
while t70<=8
    t70=t70+dt;
    set(b,'xdata',[6;6],'ydata',[t70;t70+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置二号长方体木块的运动，水平运动到第三条路线的最上方
t71=6;   dt=0.05;
while t71<=9
    t71=t71+dt;
    set(b,'xdata',[t71;t71],'ydata',[t70;t70+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置二号长方体木块的运动，竖直向下运动到第三条路线的最下方    
t72=8;   dt=0.05;
while t72>=1.0
    t72=t72-dt;
    set(b,'xdata',[9;9],'ydata',[t72;t72+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end 
% 设置五号长方体木块的运动，竖直向上运动到第一条路线的最上方
t73=1.5;  dt=0.05;
while t73<=8
    t73=t73+dt;
    set(e,'xdata',[3;3],'ydata',[t73;t73+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end   
%设置五号长方体木块的运动，水平运动到第三条路线的最上方
t74=3;   dt=0.05;
while t74<=9
    t74=t74+dt;
    set(e,'xdata',[t74;t74],'ydata',[t73;t73+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的最下方    
t75=8;   dt=0.05;
while t75>=1.5
    t75=t75-dt;
    set(e,'xdata',[9;9],'ydata',[t75;t75+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end          
%设置四号长方体木块的运动，竖直向上运动到第一条路线的最上方
t76=1.0;   dt=0.05;
while t76<=8
    t76=t76+dt;
    set(d,'xdata',[3;3],'ydata',[t76;t76+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置四号长方体木块的运动，水平运动到第二条路线的最上方
t77=3;   dt=0.05;
while t77<=6
    t77=t77+dt;
    set(d,'xdata',[t77;t77],'ydata',[t76;t76+0.5]);
    drawnow;    set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置四号长方体木块的运动，竖直向下运动到第二条路线的最下方      
t78=8;   dt=0.05;
while t78>=0.5
    t78=t78-dt;
    set(d,'xdata',[6;6],'ydata',[t78;t78+0.5]);
    drawnow; 
set(gcf,'doublebuffer','on');    %消除震动
end       
%设置五号长方体木块的运动，竖直向上运动到第三条路线的最上方
t79=2.0;   dt=0.05;
while t79<=8
    t79=t79+dt;
    set(e,'xdata',[9;9],'ydata',[t79;t79+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end       
% 设置五号长方体木块的运动，水平运动到第二条路线的最上方  
t80=9;   dt=0.05;
while t80>=6
    t80=t80-dt;
    set(e,'xdata',[t80;t80],'ydata',[t79;t79+0.5]);
    drawnow;     
set(gcf,'doublebuffer','on');    %消除震动
end        
% 设置五号长方体木块的运动，竖直向下运动到第二条路线的下方  
t81=8;    dt=0.05;
while t81>=1.0
    t81=t81-dt;
    set(e,'xdata',[6;6],'ydata',[t81;t81+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置三号长方体木块的运动，竖直向上运动到第一条路线的上方
t82=0.5;    dt=0.05;
while t82<=8
    t82=t82+dt;
    set(c,'xdata',[3;3],'ydata',[t82;t82+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %消除震动
end        
% 设置三号长方体木块的运动，水平运动到第三条路线的上方
t83=3;    dt=0.05;
while t83<=9
    t83=t83+dt;
    set(c,'xdata',[t83;t83],'ydata',[t82;t82+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end        
  % 设置三号长方体木块的运动，竖直向下运动到第三条路线的下方
t84=8;    dt=0.05;
while t84>=1.5
    t84=t84-dt;
    set(c,'xdata',[9;9],'ydata',[t84;t84+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向上运动到第二条路线的上方   
t85=1;   dt=0.05;
while t85<=8
    t85=t85+dt;
    set(e,'xdata',[6;6],'ydata',[t85;t85+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %消除震动
end     
% 设置五号长方体木块的运动，水平运动到第一条路线的最上方   
t86=6;   dt=0.05;
while t86>=3
    t86=t86-dt;
    set(e,'xdata',[t86;t86],'ydata',[8;8+0.5]);
    drawnow;
   set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置五号长方体木块的运动，竖直向下运动到第一条路线的下方
t87=8;   dt=0.05;
while t87>=0.5
    t87=t87-dt;
    set(e,'xdata',[3;3],'ydata',[t87;t87+0.5]);
    drawnow;
  set(gcf,'doublebuffer','on');    %消除震动
end     
% 设置四号长方体木块的运动，竖直向上运动到第二条路线的上方    
t88=0.5;  dt=0.05;
while t88<=8
    t88=t88+dt;
    set(d,'xdata',[6;6],'ydata',[t88;t88+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %消除震动
end          
% 设置四号长方体木块的运动，水平运动到第三条路线的上方
t89=6;   dt=0.05;
while t89<=9
    t89=t89+dt;
    set(d,'xdata',[t89;t89],'ydata',[8;8.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置四号长方体木块的运动，竖直向下运动到第三条路线的下方    
t90=8;dt=0.05;
while t90>=2.0
    t90=t90-dt;
    set(d,'xdata',[9;9],'ydata',[t90;t90+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end         
% 设置五号长方体木块的运动，竖直向上运动到第一条路线的上方
t91=0.5;dt=0.05;
while t91<=8
    t91=t91+dt;
    set(e,'xdata',[3;3],'ydata',[t91;t91+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end         
  % 设置五号长方体木块的运动，水平运动到第三条路线的上方
t92=3;dt=0.05;
while t92<=9
    t92=t92+dt;
    set(e,'xdata',[t92;t92],'ydata',[8;8.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %消除震动
end    
% 设置五号长方体木块的运动，竖直向下运动到第三条路线的下方
t93=8; dt=0.05;
while t93>=2.5
    t93=t93-dt;
    set(e,'xdata',[9;9],'ydata',[t93;t93+0.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %消除震动
end 