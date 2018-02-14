function segment = CV_2(fileName)
%function [] = CV_2(fileName)

% r,g,b value for CV assignemnt question 3
R_MIN = 0;
R_MAX = 210;
G_MIN = 1;
G_MAX = 255;
B_MIN = 200;
B_MAX = 255;
%I =  imread(fileName);
I =  imread(fileName);

% r,g,b value for CV assignemnt question 2, image 2.
%R_MIN = 150;
%R_MAX = 255;
%G_MIN = 120;
%G_MAX = 255;
%B_MIN = 249;
%B_MAX = 255;
%I =  imread('detectSky2.bmp');

% r,g,b value for CV assignemnt question 3, image 1.
% R_MIN = 0;
% R_MAX = 100;
% G_MIN = 1;
% G_MAX = 150;
% B_MIN = 100;
% I =  imread('detectSky3.bmp');

%extract the rgb component from the image I.
r = I(:, :, 1);             % red channel
g = I(:, :, 2);             % green channel
b = I(:, :, 3);             % blue channel
segment=[];

%checking if the r,g,b component on the image lies within a given range
%then make the pixels black, else make it white.
for x=1:1080
    for y=1:1920
        if r(x,y) >= R_MIN && r(x,y) <= R_MAX && g(x,y) >= G_MIN && g(x,y) <= G_MAX && b(x,y) >= B_MIN && b(x,y) <= B_MAX;
            segment(x,y)=255;
        else
            segment(x,y)=0;
        end
    end
end

%plot  the image
imshow(segment)
subplot(1,2,1);
imshow (I);
subplot(1,2,2);
imshow(segment);
colormap(gray);
end
