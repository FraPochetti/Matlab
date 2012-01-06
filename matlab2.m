close all
clear all

data = load('xy.dat');

%syntax to choose which row or column to select. Colon means 'from
%beginning to end'; so, in order to select x, I specified the following:
%"take all the rows of the first column of data".
x = data(:,1);
y = data(:,2);

%fits curve to data using first grade polynomial and creates a fit object whose features are printed into the framework. 
fit_data = fit(x,y,'poly1')

%hold on and hold off lets the user implement multiplot.
hold on
plot(x,y)
plot(fit_data, 'r')
hold off