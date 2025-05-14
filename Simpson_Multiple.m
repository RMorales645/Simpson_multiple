%RONALD ALEXIS MORALES VARELA
%0901-23-6114

f = @(x) 0.2 + 25*x - 200*x.^2 + 675*x.^3 - 900*x.^4 + 400*x.^5;
a = 0;
b = 0.8;
n = 6;
h = (b - a)/n;

x = a:h:b;
y = f(x);

% Simpson 1/3 compuesta
I_simpson = h/3 * (y(1) + ...
    4*sum(y(2:2:end-1)) + ...
    2*sum(y(3:2:end-2)) + ...
    y(end));

% Cuarta derivada
syms xs
fs = 0.2 + 25*xs - 200*xs^2 + 675*xs^3 - 900*xs^4 + 400*xs^5;
f4 = diff(fs, xs, 4);
f4_fun = matlabFunction(f4);
media_f4 = integral(f4_fun, a, b) / (b - a);

% Error de truncamiento
Et = -((b - a)^5 / (180 * n^4)) * media_f4;

% Valor exacto y error relativo
valor_exacto = 1.640533;
error_rel = abs((valor_exacto - I_simpson) / valor_exacto) * 100;

% Resultados
fprintf('Integral aproximada (Simpson 1/3): %.6f\n', I_simpson);
fprintf('Valor medio de f cuarta: %.6f\n', media_f4);
fprintf('Error de truncamiento: %.6f\n', Et);
fprintf('Error relativo porcentual: %.6f%%\n', error_rel);