clear all
close all
clc

% Vstupne udaje
a = 30; % pomer stran
b = 65;
m = 2;
n = 2;
x = 0:0.01:1;

sizex = 31.8;  % vychadza z pomeru na TJ100 fi150:30x
sizey = 68.5/2;  % vychadza z pomeru na TJ100 fi150:65y

% Rovnica
aa = a/a;
bb = b/a;
y_Q1 = (bb*nthroot(1-(x/aa).^m,n)).*(sizey/2);  % 1.kvadrant
y_Q2 = (-1*(bb*nthroot(1-(x/aa).^m,n))).*(sizey/2); % 2.kvadrant

X = x.*sizex;

% Graf
hold on
axis equal
plot(X,y_Q2)
plot(X,y_Q1)

% Ukladanie dat do suboru
y_Q2 = fliplr(y_Q2);
 
yy = [y_Q1'
     y_Q2'];
 
x1= fliplr(x);

xx = [x'
      x1'];
time = zeros(1,length(xx));
time = time'; 

SEdata_V2 = [xx.*sizex yy time];
  
filename = 'SEdataV2.xlsx';
xlswrite(filename,SEdata_V2)