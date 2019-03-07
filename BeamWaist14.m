%
%Beam waist 14.49
%
close all;
clear all;

x=[
    10.040
10.020
10.000
9.990
9.970
9.950
9.940
9.930
9.920
9.910
9.900
9.880
9.870
9.855
9.850
9.840
9.830
9.810
9.000
9.790
9.780
9.770
9.760
9.750
9.740
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

];

p=[839
831
820
809
782
739
711
669
630
576
523
396
339
264
223
178
140
81
60
44
32
23
17
10
6 ];

pError=[
    26.39
10.31
8.2
26.09
11.82
25.39
9.11
24.69
6.3
17.76
11.23
15.96
21.39
10.64
8.23
17.78
1.4
2.81
0.6
8.44
4.32
6.23
14.17
0.1
12.06
 ];

errorbar(x,p,pError,'.');
grid on;
title("x (mm) vs p (uW), distance 14.49 cm");
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
xlim([9.73, 10.07]);
grid on;
title("x (mm) vs delta P (uW), distance 14.49 cm");
xlabel("x(mm)");
ylabel("power difference (uW)");

%now use cftool to fit this curve