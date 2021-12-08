clc,clear,close all
t = uitable; 
set(t,'Data',magic(10))
set(t,'ColumnWidth',{25})


%%
clc,clear,close all
f = figure('Position',[200 200 400 150]);
dat = rand(3); 
cnames = {'X-Data','Y-Data','Z-Data'};
rnames = {'First','Second','Third'};
t = uitable('Parent',f,'Data',dat,'ColumnName',cnames,... 
            'RowName',rnames,'Position',[20 20 360 100]);
%%
clc,clear,close all
warning off
f = figure('Position',[100 100 400 150]);
dat =  {6.125, 456.3457, true,  'Fixed';...
        6.75,  510.2342, false, 'Adjustable';...   
        7,     658.2,    false, 'Fixed';};
columnname =   {'Rate', 'Amount', 'Available', 'Fixed/Adj'};
columnformat = {'numeric', 'bank', 'logical', {'Fixed' 'Adjustable'}};
columneditable =  [false false true true]; 
t = uitable('Units','normalized','Position',...
            [0.1 0.1 0.9 0.9], 'Data', dat,... 
            'ColumnName', columnname,...
            'ColumnFormat', columnformat,...
            'ColumnEditable', columneditable,...
            'RowName',[]);


        
        