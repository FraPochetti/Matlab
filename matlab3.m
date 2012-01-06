close all
clear all

data = load('xy_gauss.dat');

%syntax to choose which row or column to select. Colon means 'from
%beginning to end'; so, in order to select x, I specified the following:
%"take all the rows of the first column of data".
x = data(:,1);
y = data(:,2);

f = fittype('a.*gaussmf(x, [sig1 c1]) + b.*gaussmf(x, [sig2 c2])')
%fits curve to data using function specified above and creates a fit object whose features are printed into the framework. 
%The 'Startpoint' option lets the user select the initial guess. I
%COMPLETELY INVENTED IT, TRYING RANDOMLY!!!! not exactly a scientific method
fit_data = fit(x,y,f, 'Startpoint', [.56,.56,.56,.56,.56,.56])

%hold on and hold off lets the user implement multiplot.
hold on
plot(x,y)
plot(fit_data, 'r')
hold off