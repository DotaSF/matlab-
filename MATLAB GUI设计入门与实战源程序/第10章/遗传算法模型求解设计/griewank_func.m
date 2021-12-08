function f = griewank_func(x)
[ps, D] = size(x);

f = 1;
for i = 1 : D
    f = f .* cos(x(:, i) ./ sqrt(i));
end
f = sum(x .^ 2, 2) ./ 4000 - f + 1;


