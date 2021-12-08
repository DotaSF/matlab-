function stringSet(property,value,set)
%stringSet one of a set of strings

for i = 1:length(set)
    if strcmpi(value,set{i})
        return;
    end
end
prop = sprintf('%s %s %s %s %s',property,set{:});
error(message('globaloptim:stringSet:notCorrectChoice',property,prop));
