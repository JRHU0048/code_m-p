准备插值数据点 {x0, y0}, {x1, y1}, ..., {xn, yn}。

计算差商，并构建牛顿插值多项式。

使用多项式 P(x) 进行插值预测。

% 输入插值数据点
x = [x0, x1, x2, ...];  % 自变量
y = [y0, y1, y2, ...];  % 因变量

% 计算差商
f = y;  % 初始化 f 为 y
n = length(x);

for j = 2:n
    for i = n:-1:j
        f(i) = (f(i) - f(i-1)) / (x(i) - x(i-j+1));
    end
end

% 构建牛顿插值多项式
syms X;
P = f(1);
for j = 2:n
    term = f(j);
    for i = 1:j-1
        term = term * (X - x(i));
    end
    P = P + term;
end

% 使用多项式 P(X) 进行插值预测
X_value = 4.5;  % 需要插值的点
Y_value = subs(P, X, X_value);

disp(['在 X = ', num2str(X_value), ' 处的估计值为 Y = ', num2str(Y_value)]);
