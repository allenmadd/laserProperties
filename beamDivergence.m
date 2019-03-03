%
%Beam Divergence
%Feb 28 2019
%
close all;
clear all;

x=[
6.347
6.557
7.005
7.208


7.322
7.342
7.353
7.394
8.137
8.508
8.618

8.68
8.788

8.956
8.975
9.082
9.202];

xError = [
0.002886751346
0.002886751346
0.002886751346
0.002886751346


0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346

0.002886751346
0.002886751346

0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346
0.002886751346
];

pError=[
2.01
6.03
0.3
10.65


14.97
5.02
15.07
1.2
9.22
25.29
15.74

21.97
12.22

8.8
16.84
9
9.1 ];

p=[
1
3
30
65


97
102
107
120
522
729
774

797
822

880
884
900
910];

errorbar(x,p,pError,'.');
grid on;
title("x (mm) vs p (uW)");
xlabel("x(mm)");
ylabel("power (uW)");


%
%seems tough to fit. will fit derivative
%

deriv =[];
deriverror=[];

for i=2:length(x)
    deriv(i)=(p(i)-p(i-1))/(x(i)-x(i-1));
    deriverror(i)=sqrt(pError(i)^2 +xError(i)^2);
end

figure;

%finding the line that will intersect with the 1/e value of the derivative
y=[];
for i=1:length(deriv)
    y(i) = (1/2.7)*max(deriv);
end

%plot(deriv);
errorbar(x,deriv,deriverror,'.'); hold on;
plot(x, y);
grid on;
title("x (mm) vs delta P (uW)");
xlabel("x(mm)");
ylabel("power difference (uW)");

%now use cftool to fit this curve