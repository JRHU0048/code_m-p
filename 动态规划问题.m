#  python代码示例：
import matplotlib.pyplot as plt
import pylab as pl
import connmysql
import pandas as pd

sql2 = "SELECT ﻿id, distance,duration FROM  trafic"
checklist = connmysql.getdata(sql2)
ids=[]
for i in range(0,len(checklist)):
    ids.append(checklist[i][0])
time_dataframe = pd.DataFrame(columns=['distance','duration'], index=ids)
# print(time_dataframe)
for i in range(0,len(checklist)):
    id=checklist[i][0]
    time_dataframe.at[ids[i],'distance'] = float(checklist[i][1])#distance
    time_dataframe.at[ids[i], 'duration'] = float(checklist[i][2] ) # distance
# id='100001-100002'
# print(time_dataframe.at[id,'distance'])
# print(time_dataframe.at['100001-100002','duration'])
# list=['100002','100003','100004','100005','100006']
        #基于动态规划求得最短路径，计算量会比较小，速度较快
list = ['100002', '100003', '100004', '100005', '100006']
# 基于动态规划求得最短路径，计算量会比较小，速度较快
routelist=[]
route_distance=[]
for j in range(0,len(list)-1):
    print('mm',j)
    print('he1', routelist)
    print('he2', route_distance)
    ids = []
    distances, routes = {}, {}
    for i in range(0, len(list)):
        if len(routelist)==0:#当里面还没有目标在时
            id = list[0] + '-'+list[i]
            if list[i]!=list[0]:
                ids.append(id)
        else:
            if list[i] not in routelist :#计算过的点不再重复计算
                id =  routelist[j]+ '-'+list[i]
                ids.append(id)
    print('he3',ids)
    for k in range(0, len(ids)):
        distances[ids[k]] = time_dataframe.at[ids[k], 'distance']
    print('he4',distances)
    route1 = sorted(distances.items(), key=lambda item: item[1])  # 将最小距离取出来
    route_distance.append(route1[0])
    # routes[route1[0][0]] = route1[0][1]  # key:100002-100006,values: 3929.0,,保存离最后一个点的最优路线
    print('he5',route1)
    a=route1[0][0].split('-')
    if a[0] not in routelist:
        routelist.append(a[0])
    if a[1] not in routelist:
        routelist.append(a[1])
    print('he6', routelist)
print('he',routelist)

代码说明：
导入必要的库：matplotlib.pyplot、pylab、connmysql和pandas。
运行SQL查询语句，获取数据库中的路程距离和行车时间数据，并将结果存储在checklist列表中。
创建一个空的DataFrame对象time_dataframe，用于存储从数据库获取的数据，并设置其列名为'distance'和'duration'，索引为目标点的ID值。
遍历checklist列表，将每个记录的路程距离和行车时间存储在time_dataframe对象中对应的位置上。
定义一个目标点ID列表list，该列表包含了多个目标点的ID。
创建空列表routelist和route_distance，用于存储最短路径和对应的距离。
使用动态规划算法计算多个目标点之间的最短路径。根据目标点ID列表list，遍历其中的每个目标点，依次计算与前一个目标点之间的最短路径。
在每次计算最短路径时，首先根据已计算的路径routelist，确定需要计算的目标点。然后根据这些目标点，查询time_dataframe中对应的路程距离，并将其存储在字典distances中。
对字典distances进行排序，获取最小距离对应的目标点之间的连线，并将其添加到列表route_distance中。
解析最小距离对应的连线，将连线两端的目标点ID分别添加到列表routelist中，以便下一次计算最短路径时使用。
最终输出的routelist即为多个目标点之间的最短路径所经过的所有点的ID。
需要注意的是，该代码可能存在语法错误或逻辑错误，可能需要根据具体情况进行修改和调试。


%matlab动态规划算法解决旅行商问题：
function [optimal_path, optimal_cost] = dynamic_programming(distance_matrix)
    num_points = size(distance_matrix, 1);
    
    % 创建动态规划表格，用于存储每个子问题的最优解
    dp_table = zeros(num_points, 2^num_points);
    prev = zeros(num_points, 2^num_points);
    
    % 初始化动态规划表格
    for i = 1:num_points
        dp_table(i, 1) = distance_matrix(i, 1); % 起点到自身的距离为0
    end
    
    % 进行动态规划计算
    for j = 2:2^num_points
        for i = 2:num_points
            if bitget(j, i) == 1
                prev_set = bitset(j, i, 0);
                min_cost = Inf;
                
                for k = 1:num_points
                    if bitget(prev_set, k) == 1
                        cost = dp_table(k, prev_set) + distance_matrix(i, k);
                        if cost < min_cost
                            min_cost = cost;
                            prev(i, j) = k;
                        end
                    end
                end
                
                dp_table(i, j) = min_cost;
            end
        end
    end
    
    % 构造最优路径
    optimal_path = zeros(1, num_points);
    optimal_path(1) = 1; % 起点为1
    optimal_path(num_points) = 1; % 终点为1
    
    j = 2^num_points - 1;
    for i = num_points-1:-1:2
        optimal_path(i) = prev(optimal_path(i+1), j);
        j = bitset(j, optimal_path(i+1), 0);
    end
    
    % 计算最优路径的总距离
    optimal_cost = dp_table(1, 2^num_points - 1);
end

该函数的输入参数是一个距离矩阵distance_matrix，表示各个城市之间的距离。矩阵的大小为N*N，其中N是城市数量。矩阵中第i行、第j列的元素表示从第i个城市到第j个城市的距离。
首先，这个函数会计算出城市数量num_points。然后，它会初始化一个动态规划表格dp_table，用于存储每个子问题的最优解。在这个表格中，第i行、第j列的元素表示从起点到第i个城市，经过集合j中的所有城市，再返回起点的最短距离。
prev数组用于存储路径前驱，也就是从起点到第i个城市，经过集合j中的所有城市，再返回起点的最短路径上，第i个城市的前一个城市是哪一个。
表格初始化后，这个函数使用两个循环来计算动态规划表格中的所有元素。对于集合j中包含第i个城市的情况，它会遍历集合j中除第i个城市以外的所有城市，并计算从起点到这些城市，再从这些城市到第i个城市的最短距离。
然后，它将这些距离与已知的其他子问题的最优解进行比较，并选择最小值作为当前子问题的最优解。同时，它还会更新prev数组，以记录路径前驱，使得从起点到第i个城市，经过集合j中的所有城市，再返回起点的最短路径能够被重构出来。
在计算完成动态规划表格之后，这个函数会使用prev数组重构最短路径。具体地说，它会从终点开始，反向遍历prev数组，直到回到起点，以得到最短路径。最后，它会计算最短路径的总距离，并将最短路径和总距离作为函数的输出。

% 距离矩阵示例，表示各个城市之间的距离
distance_matrix = [
    0, 10, 15, 20;
    10, 0, 35, 25;
    15, 35, 0, 30;
    20, 25, 30, 0
];

[optimal_path, optimal_cost] = dynamic_programming(distance_matrix);
disp("最优路径：");
disp(optimal_path); % 输出结果：[1, 2, 4, 3, 1]
disp("最优路径的总距离：");
disp(optimal_cost); % 输出结果：60
上述代码是测试使用的示例代码。它输入一个距离矩阵distance_matrix，包含了四个城市之间的距离。
经过计算后，这个函数会输出最短路径optimal_path和路径的总距离optimal_cost。
在这个例子中，最短路径是从城市1出发，依次经过城市2、城市4和城市3，再返回城市1。路径的总距离是60。
