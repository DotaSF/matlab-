function createfigure6(X1, Y1)
%CREATEFIGURE6(X1, Y1)
%  X1:  x 数据的矢量
%  Y1:  y 数据的矢量

% 创建 figure
figure1 = figure('PaperSize',[20.98404194812 29.67743169791]);

% 创建 axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% 创建 plot
plot1 = plot(X1,Y1,'Parent',axes1,'LineWidth',2,'DisplayName','data1');

% 获取图中的 xdata
xdata1 = get(plot1, 'xdata');
% 获取图中的 ydata
ydata1 = get(plot1, 'ydata');
% 确保数据为列矢量
xdata1 = xdata1(:);
ydata1 = ydata1(:);


% 删除 NaN 值并发出警告
nanMask1 = isnan(xdata1(:)) | isnan(ydata1(:));
if any(nanMask1)
    warning('GeneratedCode:IgnoringNaNs', ...
        '具有 NaN 坐标的数据点将被忽略。');
    xdata1(nanMask1) = [];
    ydata1(nanMask1) = [];
end

% 查找用于基于 xlim 绘制拟合图的 x 值
axesLimits1 = xlim(axes1);
xplot1 = linspace(axesLimits1(1), axesLimits1(2));

% 为“显示方程”系数预分配
coeffs1 = cell(1,1);


[fitResults1, ignoreArg1, mu1] = polyfit(xdata1, ydata1, 7);
% 计算多项式
yplot1 = polyval(fitResults1, xplot1, [], mu1);

% 保存“显示方程”的拟合类型
fittypesArray1(1) = 8;

% 保存“显示方程”的系数
coeffs1{1} = fitResults1;

% 绘制拟合图
fitLine1 = plot(xplot1,yplot1,'DisplayName','   7 次','Parent',axes1,...
    'Tag','7th degree',...
    'Color',[0 0.5 0]);

% 将新线设置到正确位置
setLineOrder(axes1, fitLine1, plot1);

% 已选定“显示方程”
showEquations(fittypesArray1, coeffs1, 5, axes1, xdata1);

% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.600595238095237 0.874603174603175 0.173214285714286 0.1]);

%-------------------------------------------------------------------------%
function setLineOrder(axesh1, newLine1, associatedLine1)
%SETLINEORDER(AXESH1,NEWLINE1,ASSOCIATEDLINE1)
%  设置线顺序
%  AXESH1:  轴
%  NEWLINE1:  新线
%  ASSOCIATEDLINE1:  结合线

% 获取轴子级
hChildren = get(axesh1,'Children');
% 删除新行
hChildren(hChildren==newLine1) = [];
% 获取结合线的索引
lineIndex = find(hChildren==associatedLine1);
% 对各条线重新排序，以便新线显示关联数据
hNewChildren = [hChildren(1:lineIndex-1);newLine1;hChildren(lineIndex:end)];
% 设置子级:
set(axesh1,'Children',hNewChildren);

%-------------------------------------------------------------------------%
function showEquations(fittypes1, coeffs1, digits1, axesh1, xdata1)
%SHOWEQUATIONS(FITTYPES1,COEFFS1,DIGITS1,AXESH1,XDATA1)
%  显示方程
%  FITTYPES1:  拟合类型
%  COEFFS1:  系数
%  DIGITS1:  有效数字位数
%  AXESH1:  轴
%  XDATA1:  x 数据

n = length(fittypes1);
txt = cell(length(n + 2) ,1);
txt{1,:} = ' ';
for i = 1:n
    txt{i + 1,:} = getEquationString(fittypes1(i),coeffs1{i},digits1,axesh1);
end
meanx = mean(xdata1);
stdx = std(xdata1);
format = ['where z = (x - %0.', num2str(digits1), 'g)/%0.', num2str(digits1), 'g'];
txt{n + 2,:} = sprintf(format, meanx, stdx);
text(.05,.95,txt,'parent',axesh1, ...
    'verticalalignment','top','units','normalized');

%-------------------------------------------------------------------------%
function [s1] = getEquationString(fittype1, coeffs1, digits1, axesh1)
%GETEQUATIONSTRING(FITTYPE1,COEFFS1,DIGITS1,AXESH1)
%  获取“显示方程”字符串
%  FITTYPE1:  拟合类型
%  COEFFS1:  系数
%  DIGITS1:  有效数字位数
%  AXESH1:  轴

if isequal(fittype1, 0)
    s1 = '三次样条插值';
elseif isequal(fittype1, 1)
    s1 = '保形插值';
else
    op = '+-';
    format1 = ['%s %0.',num2str(digits1),'g*z^{%s} %s'];
    format2 = ['%s %0.',num2str(digits1),'g'];
    xl = get(axesh1, 'xlim');
    fit =  fittype1 - 1;
    s1 = sprintf('y =');
    th = text(xl*[.95;.05],1,s1,'parent',axesh1, 'vis','off');
    if abs(coeffs1(1) < 0)
        s1 = [s1 ' -'];
    end
    for i = 1:fit
        sl = length(s1);
        if ~isequal(coeffs1(i),0) % if exactly zero, skip it
            s1 = sprintf(format1,s1,abs(coeffs1(i)),num2str(fit+1-i), op((coeffs1(i+1)<0)+1));
        end
        if (i==fit) && ~isequal(coeffs1(i),0)
            s1(end-5:end-2) = []; % change x^1 to x.
        end
        set(th,'string',s1);
        et = get(th,'extent');
        if et(1)+et(3) > xl(2)
            s1 = [s1(1:sl) sprintf('\n     ') s1(sl+1:end)];
        end
    end
    if ~isequal(coeffs1(fit+1),0)
        sl = length(s1);
        s1 = sprintf(format2,s1,abs(coeffs1(fit+1)));
        set(th,'string',s1);
        et = get(th,'extent');
        if et(1)+et(3) > xl(2)
            s1 = [s1(1:sl) sprintf('\n     ') s1(sl+1:end)];
        end
    end
    delete(th);
    % Delete last "+"
    if isequal(s1(end),'+')
        s1(end-1:end) = []; % There is always a space before the +.
    end
    if length(s1) == 3
        s1 = sprintf(format2,s1,0);
    end
end

