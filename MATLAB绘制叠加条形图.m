推文链接：https://mp.weixin.qq.com/s/kNnUQpa09BXm5IzEbAUprw

x = [1 2 3 4 5];
temp_high = [37 39 46 56 67];  
w1 = 0.5; 
bar(x,temp_high,w1,'FaceColor',[0.2 0.2 0.5]) 

temp_low = [22 24 32 41 50]; 
w2 = .25; 
hold on
bar(x,temp_low,w2,'FaceColor',[0 0.7 0.7]) 
hold off

grid on
ylabel('Temperature (\circF)') 
legend({'Average High','Average Low'},'Location','northwest')

ax = gca;   #获取当前图形窗口的坐标轴对象的命令。通过该命令，可以在后续操作中对当前图形的坐标轴进行设置或者获取相关属性。
ax.XTick = [1 2 3 4 5];  
ax.XTickLabels = {'January','February','March','April','May'};
ax.XTickLabelRotation = 45;
