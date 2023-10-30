day_1022

% 假设row和row2是两组数据
data = [row, row2]; % 将两组数据合并为一个矩阵
corrMatrix = corrcoef(data); % 计算相关系数矩阵

% 如果要获取两组数据之间的相关系数
correlation = corrMatrix(1, 2);   %相关系数矩阵的第一行，第二列


% 假设row和row2分别是两组数据
corrMatrix = corrcoef(row, row2);   %相关系数矩阵
correlation = corrMatrix(1, 2);   %计算相关系数


% 假设row和row2是两组数据
data = [row, row2]; % 将两组数据合并为一个矩阵
corrMatrix = corrcoef(data); % 计算相关系数矩阵

% 如果要获取两组数据之间的相关系数
correlation = corrMatrix(1, 2);


% 示例cell数组   将cell转换为数值型的矩阵或向量
data = {1, 2, 3; 4, 5, 6; 7, 8, 9};

% 将cell转换为数值型的矩阵
numericData = cell2mat(data);

% 使用corrcoef计算相关系数矩阵
corrMatrix = corrcoef(numericData);


%回归分析   相关系数可以用来评估自变量与因变量之间的线性关系强度和方向。
% 假设已有自变量X和因变量Y的数据
X = [1, 2, 3, 4, 5];
Y = [3, 5, 7, 9, 11];

% 拟合回归模型
coefficients = polyfit(X, Y, 1);  % 使用一次多项式进行拟合 y=ax+b;

% 提取回归系数
slope = coefficients(1);  % 斜率
intercept = coefficients(2);  % 截距

% 计算相关系数
r = corrcoef(X, Y);
correlation = r(1, 2);

% 打印结果
disp(['回归系数：斜率=', num2str(slope), ', 截距=', num2str(intercept)]);
disp(['相关系数：', num2str(correlation)]);

**
拟合回归模型的主要作用是通过统计分析来建立自变量（预测变量）与因变量（响应变量）之间的关系模型。通过这个模型，可以对未知的因变量进行预测或者对自变量的影响进行解释。

具体而言，拟合回归模型有以下几个作用：

预测：拟合回归模型可以用已知的自变量值来预测因变量的取值。当我们有一个新的自变量观测值时，可以利用回归模型进行预测，从而得到相应的因变量预测值。

解释和推断：回归模型可以帮助解释自变量对因变量的影响程度和方向。通过分析回归系数，我们可以获得自变量对因变量的权重或贡献度。这有助于了解自变量对因变量的影响程度，并进行推断。

控制变量：回归模型能够控制其他可能对因变量产生影响的变量。在多元回归模型中，可以同时考虑多个自变量并控制它们的影响，以准确地判断某个自变量对因变量的独立影响。

模型评估和选择：拟合回归模型后，可以利用统计指标（如R平方、调整R平方、残差分析等）对模型进行评估。这些指标可以帮助判断模型的拟合程度和预测能力，并在需要时选择更好的模型。

总之，拟合回归模型通过建立自变量与因变量之间的数学关系，提供了一种对未知数据的预测和解释的方法。这对于实际问题的分析和决策具有重要意义。

**
除了相关性分析，还有一些其他常用的分析方法可以应用于数据。以下列举几个常见的分析方法：

统计描述：可以使用Matlab中的函数如mean、median、std等来计算数据的均值、中位数、标准差等统计指标。

数据可视化：使用Matlab的绘图函数（如plot、scatter、histogram等）可以对数据进行可视化，从而更好地理解数据的分布、趋势等。

假设检验：通过假设检验可以判断两组数据是否存在显著差异。Matlab中提供了一系列的统计检验函数，如ttest、anova1等。

回归分析：如果想要了解两组数据之间是否存在线性关系，可以进行回归分析。Matlab中的regress函数可以进行简单线性回归分析，而fitlm函数可以进行多元线性回归分析。

聚类分析：如果想要将数据根据相似性进行分组，可以使用聚类分析。Matlab中的kmeans函数可以进行K均值聚类分析。

**
数据可视化是数据分析的重要工具，它利用图形、图表等方式，将数据以直观、易懂、简洁的方式呈现出来。数据可视化可以帮助我们发现数据中的规律和趋势、探索数据之间的关系、识别异常值或离群点等。

以下是几种常见的数据可视化方法：

散点图：散点图是一种表示两个连续变量之间关系的二维图形。可以使用散点图来观察两个变量之间的线性或非线性关系，也可以用来发现异常值或离群点。

折线图：折线图是一种显示时间、顺序或者连续变量之间关系的二维图形。可以用来展示数据的趋势、变化情况等。

条形图：条形图是一种表示分类数据的图形。可以使用条形图来比较不同类别的数值，也可以用来显示一个类别中的不同子组成部分的相对大小。

饼图：饼图是一种表示相对比例的图形，它可以将整个数据集分成几个部分，每个部分的大小与其在整体中所占的比例成正比。

热力图：热力图是一种将二维数据以颜色等方式展示出来的图形。它可以用来观察数据的分布情况，特别适用于大量连续型数据的可视化。

箱线图：箱线图是一种表示数据分布情况的图形，它可以用来显示一组连续变量的中位数、四分位数、异常值等统计指标。

地理图：地理图是一种以地理空间为基础的数据可视化方法。它可以显示各个地区的数量、密度、分布等信息。

数据可视化不仅能够帮助我们更好地理解和解释数据，而且还能够提高数据分析的效率和准确性，使得数据分析结果更具有可信度和说服力。

**
MATLAB中绘制散点图和折线图的基本代码示例
x = [1, 2, 3, 4, 5];
y = [23, 45, 67, 89, 101];
scatter(x,y)
scatter(x,y,'filled','MarkerEdgeColor',[0 .5 .5],'MarkerFaceColor',[0 .7 .7],'LineWidth',1.5)
%这样绘制的散点图中，点为实心圆形，边缘颜色为深蓝色，填充颜色为浅蓝色，线条宽度为1.5。RGB

在MATLAB中绘制折线图的示例如下：
plot(x,y)
plot(x,y,'--r','LineWidth',2)  %这样绘制的折线图中，线条为红色虚线，线条宽度为2。


day_1025

>> % 数据
categories = {'大洋洲', '西亚', '独联体', '北美', '欧洲', '东亚', '中东', '北非', '拉丁', '印度'};
barData1 = [28, 20, 19, 18, 18, 13, 13, 12, 11, 11]; % 淡色条形图数据
barData2 = [384, 364, 227, 301, 181, 50, 0, 0, 0, 318]; % 深色条形图数据
lineData = [418, 384, 246, 319, 199, 63, 13, 12, 11, 329]; % 折线图数据

% 创建图形
figure('Color', 'white');
axes('FontSize', 10, 'Box', 'off', 'LineWidth', 1.5);

% 创建堆叠条形图
b = bar([barData1; barData2]', 'stacked');

% 设置条形图颜色和样式
b(1).FaceColor = [0.8, 0.8, 0.8];
b(2).FaceColor = [0.2, 0.6, 1];
b(1).EdgeColor = 'none';
b(2).EdgeColor = 'none';

% 在条形图上显示数值
for i = 1:length(barData1)
    text(i, barData1(i)/2, num2str(barData1(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 8);
    text(i, barData1(i) + barData2(i) - (barData2(i)/2), num2str(barData2(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'FontSize', 8);
end

hold on;

% 创建折线图
yyaxis right;
p = plot(lineData, 'o-', 'LineWidth', 2, 'Color', 'k', 'MarkerSize', 6, 'MarkerFaceColor', 'k');
set(gca, 'YColor', 'k');

% 在折线图上显示数值
for i = 1:length(lineData)
    text(i, lineData(i), ['  ' num2str(lineData(i))], 'FontSize', 8, 'Color', 'k', 'VerticalAlignment', 'bottom');
end

% 设置图表标题和标签
title('2022年某公司地区分布', 'FontSize', 14, 'FontWeight', 'normal');
ylabel('数量');
set(gca, 'XTick', 1:length(categories), 'XTickLabel', categories, 'TickLabelInterpreter', 'none', 'TickDir', 'out', 'TickLength', [0.02 0.025]);
legend({'淡色数据', '深色数据', '折线图数据'}, 'Location', 'northwest', 'Box', 'off');

% 调整坐标轴外观
ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = 'k';
grid on;

hold off;

day_1026

**二维气泡云图   由散点图函数画出，有点局限性
% 生成随机数据
X = rand(100, 1) * 100; % X坐标
Y = rand(100, 1) * 100; % Y坐标
S = rand(100, 1) * 100; % 点的大小
C = rand(100, 1) * 100; % 点的颜色

% 绘制气泡图
scatter(X, Y, S, C, 'filled');   %scatter函数是用来绘制散点图的，填充就是气泡云图，有点局限性
colorbar; % 显示颜色条
xlabel('X-axis');
ylabel('Y-axis');
title('2D Bubble Chart');


**三维散点图  气泡云图
% 生成随机数据
X = rand(100,1) * 100; % X坐标，100个0到100之间的数
Y = rand(100,1) * 100; % Y坐标
Z = rand(100,1) * 100; % Z坐标
S = rand(100,1) * 100; % 每个点的大小
C = rand(100,1) * 100; % 每个点的颜色

% 绘制气泡图
scatter3(X, Y, Z, S, C, 'filled');
colorbar; % 显示颜色条
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
title('3D Bubble Chart');
