%
%Beam waist 7.52
%
close all;
clear all;

x=[
9.820
9.800
9.782
9.770
9.765
9.740
9.730
9.720
9.710
9.700
9.690
9.680
9.670
9.660
9.650
9.640
9.630
9.620
9.610
9.600
9.590
9.580
9.570
9.560
9.550
9.540
9.530
9.520
9.510
9.500
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
    878
874
865
856
831
817
794
765
741
704
639
616
558
490
454
390
338
274
234
182
147
114
87
68
48
36
24
18
12
8
];

pError=[
    24.78
16.74
18.65
20.56
10.31
22.17
15.94
17.65
9.41
15.04
24.39
18.16
21.58
4.9
12.54
3.9
19.38
10.74
10.34
5.82
15.47
9.14
14.87
16.68
16.48
12.36
8.24
16.18
4.12
16.08
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
x2=[];

for i=2:length(x)
    a=(p(i)-p(i-1))/(x(i)-x(i-1));
    if (a < 5000)
        deriv(i)=(p(i)-p(i-1))/(x(i)-x(i-1));
        deriverror(i)=sqrt(pError(i)^2 +xError(i)^2);
        x2(i)=x(i);
    end
end

figure;

%finding the line that will intersect with the 1/e value of the derivative
y=[];
for i=1:length(deriv)
    y(i) = (1/2.7)*max(deriv);
end

%plot(deriv);
errorbar(x2,deriv,deriverror,'.'); hold on;
plot(x2, y);
xlim([9.4, 9.9]);
grid on;
title("x (mm) vs delta P (uW)");
xlabel("x(mm)");
ylabel("power difference (uW)");

%now use cftool to fit this curve