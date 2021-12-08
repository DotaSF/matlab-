function hh = bar3(varargin)

error(nargchk(1,inf,nargin,'struct'));
[cax,args] = axescheck(varargin{:});

[msg,x,y,xx,yy,linetype,plottype,barwidth,zz] = makebars(args{:},'3');
if ~isempty(msg), error(msg); end %#ok

m = size(y,2); % 列
% 创建一个图形
cax = newplot(cax);
fig = ancestor(cax,'figure');

next = lower(get(cax,'NextPlot'));
hold_state = ishold(cax);
edgec = get(fig,'defaultaxesxcolor');
facec = 'flat';
h = []; 
cc = ones(size(yy,1),4);

if ~isempty(linetype)
    facec = linetype;
end
mycolor = zz;
mycolor(:,1:4:end) = mycolor(:,1:4:end) + mycolor(:,2:4:end);
mycolor(:,4:4:end) = mycolor(:,4:4:end) + mycolor(:,3:4:end);
mycolor(1:6:end,:) = mycolor(1:6:end,:)+mycolor(2:6:end,:);
mycolor((4:5):6:end,:) = mycolor((4:5):6:end,:)+mycolor((2:3):6:end,:);

for i=1:size(yy,2)/4
    acolor = mycolor(:,(i-1)*4+(1:4)).*cc;
    h = [h,surface('xdata',xx+x(i),...
            'ydata',yy(:,(i-1)*4+(1:4)), ...
            'zdata',zz(:,(i-1)*4+(1:4)),...
            'cdata',acolor, ...
            'FaceColor',facec,...
            'EdgeColor',edgec,...
            'tag','bar3',...
            'parent',cax)];
end

if length(h)==1
    set(cax,'clim',[1 2]);
end

if ~hold_state, 
  if all(all(floor(y)==y)) && (size(y,1)<16) 
      set(cax,'ytick',y(:,1));
  end
  
 xTickAmount = sort(unique(x(1,:))); 
 if length(xTickAmount)<2
     set(cax,'xtick',[]);  % 设置X轴
 elseif length(xTickAmount)<=16
      set(cax,'xtick',xTickAmount); % 设置X轴
 end
  
  hold(cax,'off'), view(cax,3), grid(cax,'on')
  set(cax,...
      'NextPlot',next,...
      'ydir','reverse');
  if plottype==0,
    set(cax,'xlim',[1-barwidth/m/2 max(x)+barwidth/m/2])
  else
    set(cax,'xlim',[1-barwidth/2 max(x)+barwidth/2])
  end

  dx = diff(get(cax,'xlim'));
  dy = size(y,1)+1;
  if plottype==2,
    set(cax,'PlotBoxAspectRatio',[dx dy (sqrt(5)-1)/2*dy])
  else
    set(cax,'PlotBoxAspectRatio',[dx dy (sqrt(5)-1)/2*dy])
  end
end

if nargout>0, 
    hh = h; 
end

