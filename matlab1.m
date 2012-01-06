close all
clear all

a = rand(10,1);
normalized_a = a/norm(a);

A = rand(10);
for i=1:10
    A(i,i) = normalized_a(i)
end    

max=1;
min=-1;
len=100;
x=min+(max-min)*rand(1,len)

y = x.^2;

plot(x,y,'o')
