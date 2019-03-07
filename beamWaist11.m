%
%Beam waist 11.9
%
close all;
clear all;

x=[
10.250
10.230
10.220
10.200
10.180
10.170
10.160
10.150
10.140
10.130
10.120
10.110
10.100
10.090
10.080
10.060
10.050
10.040

];

xError = [
    0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
0.02886751346
];

p=[
    865
863
860
840
755
700
610
510
395
300
195
125
74
47
28
9
4
3
];

pError=[
18.65
14.63
8.6
8.4
17.55
7
6.1
5.1
13.95
3
11.95
11.25
8.74
14.47
16.28
18.09
8.04
6.03
 ];

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
%xlim([9.73, 10.07]);
grid on;
title("x (mm) vs delta P (uW)");
xlabel("x(mm)");
ylabel("power difference (uW)");

%now use cftool to fit this curve