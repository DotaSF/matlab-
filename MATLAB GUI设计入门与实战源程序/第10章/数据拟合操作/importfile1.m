function a=importfile1(fileToRead1)
%IMPORTFILE1(FILETOREAD1)
%  ��ָ���ļ��е�������
%  FILETOREAD1:  Ҫ��ȡ���ļ�

% �����ļ�
newData1 = load('-mat', fileToRead1);

% �ڻ����������д���Щ�ֶδ����±�����
vars = fieldnames(newData1);
for i = 1:length(vars)
    assignin('base', vars{i}, newData1.(vars{i}));
    a=newData1.(vars{i});
end

