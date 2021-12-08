function a=importfile1(fileToRead1)
%IMPORTFILE1(FILETOREAD1)
%  从指定文件中导入数据
%  FILETOREAD1:  要读取的文件

% 导入文件
newData1 = load('-mat', fileToRead1);

% 在基础工作区中从这些字段创建新变量。
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
    a=newData1.(vars{i});
end

