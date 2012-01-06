%shuts down all figures and clears all variables set in the framework
close all
clear all

a = rand(10,1);
normalized_a = a/norm(a);

A = rand(10);
%this line lets the user set the diagonal elements of a matrix.
%eye(size(A)) creates an identity matrix the same size as A. Then this
%matrix is converted to a 'logical array' (not well understood), by the
%logical function.This logical array is the argument of matrix A... and
%then RTFM: http://www.mathworks.it/help/techdoc/ref/logical.html
A(logical(eye(size(A)))) = normalized_a;

max=1;
min=-1;
len=100;
x=min+(max-min)*rand(1,len)

%the point '.' is a special matlab operator which means "make the operation
%element by element, or better x(1)*x(1), x(2)*x(2), ecc"
y = x.^2;

%plots x versus y using blue (default) empty circles.
plot(x,y,'o')
