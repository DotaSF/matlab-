function nonNegScalar(property,value)
%nonNegScalar any scalar >= 0    

valid =  isreal(value) && isscalar(value) && (value >= 0);
if(~valid)
    error(message('globaloptim:nonNegScalar:notNonNegScalar', property));
end
