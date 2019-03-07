%
%Beam Waist Fitting
%

%All of the data
z=[38.05, 14.49, 11.9, 7.52, 5.3];
d=[1.15, .41, .08, .18, .21];

%data before focal point including 11.9
z1= [38.05, 14.49, 11.9];
d1= [1.15, .41, .08];

%data affter focal point including 11.9
z2=[11.9, 7.52, 5.3];
d2=[.08, .18,.21];


%fit lines
    %first fit line
x1=[];
y1=[];
    %second fit line
x2=[];
y2=[];

for i = 1:40
    x1(i)=i;
    y1(i)=x1(i)*.03715-.2512;
    x2(i)=i;
    y2(i)=x2(i)*-.02014+.3326;
end


figure;
plot(z1,d1,'o'); hold on;
plot(z2, d2, 'o'); hold on;
plot(x1,y1); hold on;
plot(x2,y2);
legend("Data Before Focal Point", "Data After Focal Point", "y=.03715x-.2512", "y=-.02014x+.3326");
grid on;
title("z vs D(z)");
xlabel("distance between lens and knife (cm)");
ylabel("D(z) (cm)");