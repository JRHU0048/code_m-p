%{
      n个节点数据以数组 x0, y0输入
      m个插值点以数组 x 输入
      输出数组 y 为m 个插值。
    参数输入:
        x0,y0是原有的数据
        x为插值点(范围)
    参数输出
        y为x的插值输出
%}
function y=lagrange(x0,y0,x);
n=length(x0);
m=length(x);
for i=1:m
    z=x(i);
    sum=0.0;
    for k=1:n %得到拉格朗日多项式
        p=1.0;
        for j=1:n
            if j~=k
                p=p*(z-x0(j))/(x0(k)-x0(j)); %n-1次多项式
            end
        end
        sum=p*y0(k)+sum;
    end
    y(i)=sum;
end

实操：
% 拉格朗日插值法
 
% 原始数据
x0 = 0:0.1:1;
y0 = [-0.447,1.978,3.28,6.16,7.08,7.34,7.66,9.56,9.48,9.3,11.2];
hold on;
grid on;
plot(x0,y0,'b*')
 
% 插值点
x = 0:0.01:1;
% 拉格朗日多项式插值
y = lagrange(x0,y0,x);
plot(x,y,'r--');
legend('原始数据','拉格朗日插值','Location','North');
