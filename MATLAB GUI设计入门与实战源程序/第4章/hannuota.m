%��ŵ����Ϸ���� ������ʾ
% ��ŵ����Ϸ�㷨:
%     ����������ɴӴ�С������һ���ľ���ƶ������ұ������ϣ�ľ��Խ���㷨Խ���ӣ�,
% ��Ҫ��
% 1) ÿ��ֻ���ƶ�һ��ľ��.
% 2�����ƶ�������Ҫʼ�ձ���С��ľ���ڴ��ľ��֮�ϡ�
% 3�������ƶ������в��ܳ�����ײ�����.
hf=figure('name','��ŵ����Ϸ����');    %�ӱ���
axis([0,12,0,12]);     %������
set(hf,'color','w');       %��䱳��
hold on;       %����ͼ��
axis('off');       %����������
rectangle('position',[0,0,12,0.5],'FaceColor',[0,1.0,0]);    %���װ�
line([3;3],[0.5,8],'color','r','linestyle','-','linewidth',1.5);
line([6;6],[0.5,8],'color','r','linestyle','-','linewidth',1.5);
line([9;9],[0.5,8],'color','r','linestyle','-','linewidth',1.5);    %��������·��
a=line([3;3],[0.5,1.0],'color','c','linestyle','-','linewidth',65); %����һ�ų�����ľ��
b=line([3;3],[1.0,1.5],'color','b','linestyle','-','linewidth',45);%�������ų�����ľ��
c=line([3;3],[1.5,2.0],'color','k','linestyle','-','linewidth',30); %�������ų�����ľ��
d=line([3;3],[2.0,2.5],'color','y','linestyle','-','linewidth',25);%�����ĺų�����ľ��
e=line([3;3],[2.5,3.0],'color','m','linestyle','-','linewidth',15);%������ų�����ľ��

%������ľ����˶�
%������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����Ϸ�
t1=2.5;  dt=0.05;
while t1<=8
    t1=t1+dt;
    set(e,'xdata',[3;3],'ydata',[t1;t1+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t2=3;   dt=0.05;
while t2<=9
    t2=t2+dt;
    set(e,'xdata',[t2;t2],'ydata',[t1;t1+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t3=8;   dt=0.05;
while t3>=0.5
    t3=t3-dt;
    set(e,'xdata',[9;9],'ydata',[t3;t3+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end          
%�����ĺų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����Ϸ�
t4=2.0;   dt=0.05;
while t4<=8
    t4=t4+dt;
    set(d,'xdata',[3;3],'ydata',[t4;t4+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end          
% �����ĺų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�
t5=3;   dt=0.05;
while t5<=6
    t5=t5+dt;
    set(d,'xdata',[t5;t5],'ydata',[t4;t4+0.5]);
    drawnow;    set(gcf,'doublebuffer','on');    %������
end    
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ����·�      
t6=8;   dt=0.05;
while t6>=0.5
    t6=t6-dt;
    set(d,'xdata',[6;6],'ydata',[t6;t6+0.5]);
    drawnow; 
set(gcf,'doublebuffer','on');    %������
end       
%������ų�����ľ����˶�����ֱ�����˶���������·�ߵ����Ϸ�
t7=0.5;   dt=0.05;
while t7<=8
    t7=t7+dt;
    set(e,'xdata',[9;9],'ydata',[t7;t7+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�  
t8=9;   dt=0.05;
while t8>=6
    t8=t8-dt;
    set(e,'xdata',[t8;t8],'ydata',[t7;t7+0.5]);
    drawnow;     
set(gcf,'doublebuffer','on');    %������
end        
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�  
t9=8;    dt=0.05;
while t9>=1.0
    t9=t9-dt;
    set(e,'xdata',[6;6],'ydata',[t9;t9+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %������
end          
% �������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t10=1.5;    dt=0.05;
while t10<=8
    t10=t10+dt;
    set(c,'xdata',[3;3],'ydata',[t10;t10+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end        
% �������ų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t11=3;    dt=0.05;
while t11<=9
    t11=t11+dt;
    set(c,'xdata',[t11;t11],'ydata',[t10;t10+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end        
  % �������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�
t12=8;    dt=0.05;
while t12>=0.5
    t12=t12-dt;
    set(c,'xdata',[9;9],'ydata',[t12;t12+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�   
t13=1;   dt=0.05;
while t13<=8
    t13=t13+dt;
    set(e,'xdata',[6;6],'ydata',[t13;t13+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end     
% ������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�   
t14=6;   dt=0.05;
while t14>=3
    t14=t14-dt;
    set(e,'xdata',[t14;t14],'ydata',[8;8+0.5]);
    drawnow;
   set(gcf,'doublebuffer','on');    %������
end          
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�
t15=8;   dt=0.05;
while t15>=1.5
    t15=t15-dt;
    set(e,'xdata',[3;3],'ydata',[t15;t15+0.5]);
    drawnow;
  set(gcf,'doublebuffer','on');    %������
end     
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�    
t16=0.5;  dt=0.05;
while t16<=8
    t16=t16+dt;
    set(d,'xdata',[6;6],'ydata',[t16;t16+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %������
end          
% �����ĺų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t17=6;   dt=0.05;
while t17<=9
    t17=t17+dt;
    set(d,'xdata',[t17;t17],'ydata',[8;8.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %������
end    
% �����ĺų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t18=8;dt=0.05;
while t18>=1
    t18=t18-dt;
    set(d,'xdata',[9;9],'ydata',[t18;t18+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end         
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t19=1.0;dt=0.05;
while t19<=8
    t19=t19+dt;
    set(e,'xdata',[3;3],'ydata',[t19;t19+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end         
  % ������ų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t20=3;dt=0.05;
while t20<=9
    t20=t20+dt;
    set(e,'xdata',[t20;t20],'ydata',[8;8.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�
t21=8; dt=0.05;
while t21>=1.5
    t21=t21-dt;
    set(e,'xdata',[9;9],'ydata',[t21;t21+0.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %������
end  
% ���ö��ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t22=1.0;  dt=0.05;
while t22<=8
    t22=t22+dt;
    set(b,'xdata',[3;3],'ydata',[t22;t22+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
% ���ö��ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ��Ϸ�
t23=3;   dt=0.05;
while t23<=6
    t23=t23+dt;
    set(b,'xdata',[t23;t23],'ydata',[t22;t22+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ���ö��ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ����·�    
t24=8;   dt=0.05;
while t24>=0.5
    t24=t24-dt;
    set(b,'xdata',[6;6],'ydata',[t24;t24+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end        
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t25=1.5;  dt=0.05;
while t25<=8
    t25=t25+dt;
    set(e,'xdata',[9;9],'ydata',[t25;t25+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
% ������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ��Ϸ�
t26=9;   dt=0.05;
while t26>=6
    t26=t26-dt;
    set(e,'xdata',[t26;t26],'ydata',[t25;t25+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�    
t27=8;   dt=0.05;
while t27>=1.0
    t27=t27-dt;
    set(e,'xdata',[6;6],'ydata',[t27;t27+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end       
% �����ĺų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t28=1.5;  dt=0.05;
while t28<=8
    t28=t28+dt;
    set(d,'xdata',[9;9],'ydata',[t28;t28+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end
% �����ĺų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ��Ϸ�
t29=9;   dt=0.05;
while t29>=3
    t29=t29-dt;
    set(d,'xdata',[t29;t29],'ydata',[t28;t28+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �����ĺų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�    
t30=8;   dt=0.05;
while t30>=1.0
    t30=t30-dt;
    set(d,'xdata',[3;3],'ydata',[t30;t30+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�
t31=1.0;  dt=0.05;
while t31<=8
    t31=t31+dt;
    set(e,'xdata',[6;6],'ydata',[t31;t31+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
% ������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ��Ϸ�
t32=6;   dt=0.05;
while t32>=3
    t32=t32-dt;
    set(e,'xdata',[t32;t32],'ydata',[t31;t31+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�    
t33=8;   dt=0.05;
while t33>=1.5
    t33=t33-dt;
    set(e,'xdata',[3;3],'ydata',[t33;t33+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% �������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t34=0.5;  dt=0.05;
while t34<=8
    t34=t34+dt;
    set(c,'xdata',[9;9],'ydata',[t34;t34+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
% �������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ��Ϸ�
t35=9;   dt=0.05;
while t35>=6
    t35=t35-dt;
    set(c,'xdata',[t35;t35],'ydata',[t34;t34+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�    
t36=8;   dt=0.05;
while t36>=1.0
    t36=t36-dt;
    set(c,'xdata',[6;6],'ydata',[t36;t36+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t37=1.5;  dt=0.05;
while t37<=8
    t37=t37+dt;
    set(e,'xdata',[3;3],'ydata',[t37;t37+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t38=3;   dt=0.05;
while t38<=9
    t38=t38+dt;
    set(e,'xdata',[t38;t38],'ydata',[t37;t37+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t39=8;   dt=0.05;
while t39>=0.5
    t39=t39-dt;
    set(e,'xdata',[9;9],'ydata',[t39;t39+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�
t40=2.5;  dt=0.05;
while t40<=8
    t40=t40+dt;
    set(d,'xdata',[3;3],'ydata',[t40;t40+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%�����ĺų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�
t41=3;   dt=0.05;
while t41<=6
    t41=t41+dt;
    set(d,'xdata',[t41;t41],'ydata',[t40;t40+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�    
t42=8;   dt=0.05;
while t42>=1.5
    t42=t42-dt;
    set(d,'xdata',[6;6],'ydata',[t42;t42+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t43=0.5;  dt=0.05;
while t43<=8
    t43=t43+dt;
    set(e,'xdata',[9;9],'ydata',[t43;t43+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�
t44=9;   dt=0.05;
while t44>=6
    t44=t44-dt;
    set(e,'xdata',[t44;t44],'ydata',[t43;t43+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�    
t45=8;   dt=0.05;
while t45>=2.0
    t45=t45-dt;
    set(e,'xdata',[6;6],'ydata',[t45;t45+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end   
% ����һ�ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t46=0.5;  dt=0.05;
while t46<=8
    t46=t46+dt;
    set(a,'xdata',[3;3],'ydata',[t46;t46+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%����һ�ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t47=3;   dt=0.05;
while t47<=9
    t47=t47+dt;
    set(a,'xdata',[t47;t47],'ydata',[t46;t46+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ����һ�ų�����ľ����˶�����ֱ�����˶���������·�ߵ����·�    
t48=8;   dt=0.05;
while t48>=0.5
    t48=t48-dt;
    set(a,'xdata',[9;9],'ydata',[t48;t48+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�
t49=2.0;  dt=0.05;
while t49<=8
    t49=t49+dt;
    set(e,'xdata',[6;6],'ydata',[t49;t49+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�
t50=6;   dt=0.05;
while t50>=3
    t50=t50-dt;
    set(e,'xdata',[t50;t50],'ydata',[t49;t49+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����·�    
t51=8;   dt=0.05;
while t51>=0.5
    t51=t51-dt;
    set(e,'xdata',[3;3],'ydata',[t51;t51+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end    
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�
t52=1.5;  dt=0.05;
while t52<=8
    t52=t52+dt;
    set(d,'xdata',[6;6],'ydata',[t52;t52+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%�����ĺų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t53=6;   dt=0.05;
while t53<=9
    t53=t53+dt;
    set(d,'xdata',[t53;t53],'ydata',[t52;t52+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �����ĺų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t54=8;   dt=0.05;
while t54>=1.0
    t54=t54-dt;
    set(d,'xdata',[9;9],'ydata',[t54;t54+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t55=0.5;  dt=0.05;
while t55<=8
    t55=t55+dt;
    set(e,'xdata',[3;3],'ydata',[t55;t55+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t56=3;   dt=0.05;
while t56<=9
    t56=t56+dt;
    set(e,'xdata',[t56;t56],'ydata',[t55;t55+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t57=8;   dt=0.05;
while t57>=1.5
    t57=t57-dt;
    set(e,'xdata',[9;9],'ydata',[t57;t57+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% �������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ����Ϸ�
t58=1.0;  dt=0.05;
while t58<=8
    t58=t58+dt;
    set(c,'xdata',[6;6],'ydata',[t58;t58+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%�������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�
t59=6;   dt=0.05;
while t59>=3
    t59=t59-dt;
    set(c,'xdata',[t59;t59],'ydata',[t58;t58+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����·�    
t60=8;   dt=0.05;
while t60>=0.5
    t60=t60-dt;
    set(c,'xdata',[3;3],'ydata',[t60;t60+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��Ϸ�
t61=1.5;  dt=0.05;
while t61<=8
    t61=t61+dt;
    set(e,'xdata',[9;9],'ydata',[t61;t61+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�
t62=9;   dt=0.05;
while t62>=6
    t62=t62-dt;
    set(e,'xdata',[t62;t62],'ydata',[t61;t61+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�    
t63=8;   dt=0.05;
while t63>=1.0
    t63=t63-dt;
    set(e,'xdata',[6;6],'ydata',[t63;t63+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% �����ĺų�����ľ����˶�����ֱ�����˶���������·�ߵ����Ϸ�
t64=1.0;  dt=0.05;
while t64<=8
    t64=t64+dt;
    set(d,'xdata',[9;9],'ydata',[t64;t64+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%�����ĺų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�
t65=9;   dt=0.05;
while t65>=3
    t65=t65-dt;
    set(d,'xdata',[t65;t65],'ydata',[t64;t64+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% �����ĺų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�    
t66=8;   dt=0.05;
while t66>=1.0
    t66=t66-dt;
    set(d,'xdata',[3;3],'ydata',[t66;t66+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ����Ϸ�
t67=1.0;  dt=0.05;
while t67<=8
    t67=t67+dt;
    set(e,'xdata',[6;6],'ydata',[t67;t67+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�
t68=6;   dt=0.05;
while t68>=3
    t68=t68-dt;
    set(e,'xdata',[t68;t68],'ydata',[t67;t67+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�    
t69=8;   dt=0.05;
while t69>=1.5
    t69=t69-dt;
    set(e,'xdata',[3;3],'ydata',[t69;t69+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end
% ���ö��ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�
t70=0.5;  dt=0.05;
while t70<=8
    t70=t70+dt;
    set(b,'xdata',[6;6],'ydata',[t70;t70+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%���ö��ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t71=6;   dt=0.05;
while t71<=9
    t71=t71+dt;
    set(b,'xdata',[t71;t71],'ydata',[t70;t70+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ���ö��ų�����ľ����˶�����ֱ�����˶���������·�ߵ����·�    
t72=8;   dt=0.05;
while t72>=1.0
    t72=t72-dt;
    set(b,'xdata',[9;9],'ydata',[t72;t72+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end 
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����Ϸ�
t73=1.5;  dt=0.05;
while t73<=8
    t73=t73+dt;
    set(e,'xdata',[3;3],'ydata',[t73;t73+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end   
%������ų�����ľ����˶���ˮƽ�˶���������·�ߵ����Ϸ�
t74=3;   dt=0.05;
while t74<=9
    t74=t74+dt;
    set(e,'xdata',[t74;t74],'ydata',[t73;t73+0.5]);
    drawnow;     set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ����·�    
t75=8;   dt=0.05;
while t75>=1.5
    t75=t75-dt;
    set(e,'xdata',[9;9],'ydata',[t75;t75+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end          
%�����ĺų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ����Ϸ�
t76=1.0;   dt=0.05;
while t76<=8
    t76=t76+dt;
    set(d,'xdata',[3;3],'ydata',[t76;t76+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end          
% �����ĺų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�
t77=3;   dt=0.05;
while t77<=6
    t77=t77+dt;
    set(d,'xdata',[t77;t77],'ydata',[t76;t76+0.5]);
    drawnow;    set(gcf,'doublebuffer','on');    %������
end    
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ����·�      
t78=8;   dt=0.05;
while t78>=0.5
    t78=t78-dt;
    set(d,'xdata',[6;6],'ydata',[t78;t78+0.5]);
    drawnow; 
set(gcf,'doublebuffer','on');    %������
end       
%������ų�����ľ����˶�����ֱ�����˶���������·�ߵ����Ϸ�
t79=2.0;   dt=0.05;
while t79<=8
    t79=t79+dt;
    set(e,'xdata',[9;9],'ydata',[t79;t79+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end       
% ������ų�����ľ����˶���ˮƽ�˶����ڶ���·�ߵ����Ϸ�  
t80=9;   dt=0.05;
while t80>=6
    t80=t80-dt;
    set(e,'xdata',[t80;t80],'ydata',[t79;t79+0.5]);
    drawnow;     
set(gcf,'doublebuffer','on');    %������
end        
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��·�  
t81=8;    dt=0.05;
while t81>=1.0
    t81=t81-dt;
    set(e,'xdata',[6;6],'ydata',[t81;t81+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %������
end          
% �������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t82=0.5;    dt=0.05;
while t82<=8
    t82=t82+dt;
    set(c,'xdata',[3;3],'ydata',[t82;t82+0.5]);
    drawnow;    
set(gcf,'doublebuffer','on');    %������
end        
% �������ų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t83=3;    dt=0.05;
while t83<=9
    t83=t83+dt;
    set(c,'xdata',[t83;t83],'ydata',[t82;t82+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end        
  % �������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�
t84=8;    dt=0.05;
while t84>=1.5
    t84=t84-dt;
    set(c,'xdata',[9;9],'ydata',[t84;t84+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�   
t85=1;   dt=0.05;
while t85<=8
    t85=t85+dt;
    set(e,'xdata',[6;6],'ydata',[t85;t85+0.5]);
    drawnow;   
set(gcf,'doublebuffer','on');    %������
end     
% ������ų�����ľ����˶���ˮƽ�˶�����һ��·�ߵ����Ϸ�   
t86=6;   dt=0.05;
while t86>=3
    t86=t86-dt;
    set(e,'xdata',[t86;t86],'ydata',[8;8+0.5]);
    drawnow;
   set(gcf,'doublebuffer','on');    %������
end          
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��·�
t87=8;   dt=0.05;
while t87>=0.5
    t87=t87-dt;
    set(e,'xdata',[3;3],'ydata',[t87;t87+0.5]);
    drawnow;
  set(gcf,'doublebuffer','on');    %������
end     
% �����ĺų�����ľ����˶�����ֱ�����˶����ڶ���·�ߵ��Ϸ�    
t88=0.5;  dt=0.05;
while t88<=8
    t88=t88+dt;
    set(d,'xdata',[6;6],'ydata',[t88;t88+0.5]);
    drawnow;  
set(gcf,'doublebuffer','on');    %������
end          
% �����ĺų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t89=6;   dt=0.05;
while t89<=9
    t89=t89+dt;
    set(d,'xdata',[t89;t89],'ydata',[8;8.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %������
end    
% �����ĺų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�    
t90=8;dt=0.05;
while t90>=2.0
    t90=t90-dt;
    set(d,'xdata',[9;9],'ydata',[t90;t90+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end         
% ������ų�����ľ����˶�����ֱ�����˶�����һ��·�ߵ��Ϸ�
t91=0.5;dt=0.05;
while t91<=8
    t91=t91+dt;
    set(e,'xdata',[3;3],'ydata',[t91;t91+0.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end         
  % ������ų�����ľ����˶���ˮƽ�˶���������·�ߵ��Ϸ�
t92=3;dt=0.05;
while t92<=9
    t92=t92+dt;
    set(e,'xdata',[t92;t92],'ydata',[8;8.5]);
    drawnow;
set(gcf,'doublebuffer','on');    %������
end    
% ������ų�����ľ����˶�����ֱ�����˶���������·�ߵ��·�
t93=8; dt=0.05;
while t93>=2.5
    t93=t93-dt;
    set(e,'xdata',[9;9],'ydata',[t93;t93+0.5]);
    drawnow;
    set(gcf,'doublebuffer','on');    %������
end 