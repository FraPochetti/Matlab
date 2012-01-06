%shuts down all figures and clears all variables set in the framework
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

%the point '.' is a special matlab operator which means "make the operation
%element by element, or better x(1)*x(1), x(2)*x(2), ecc"
y = x.^2;

%plots x versus y using blue (default) empty circles.
plot(x,y,'o')
