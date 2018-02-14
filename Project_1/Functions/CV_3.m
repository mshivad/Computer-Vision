function d1 = CV_3(fileName1, fileName2)
%function disparity = CV_3(fileName1, fileName2)

%intialisation of variables and defining the limits
DISPARITY_RANGE = 50;
WIN_SIZE = 5;
EXTEND = (WIN_SIZE-1)/2;

%image 1
left= imread(fileName1);
right=imread(fileName2);

%image 2
%left= imread('left2.png');
%right=imread('right2.png');

%image 3
%left= imread('left3.bmp');
%right=imread('right3.bmp');

%converting the image to 2D
Ileft = rgb2gray (left);
Iright = rgb2gray(right);

%initialzing the disparity images and getting the limits set.
[m,n]=size(Ileft);
Ny=m;
Nx=n;
ny=Ny-2;
nx=Nx-2;
disparity=zeros(375,450);

%finding the dispaity image. Using NCC to get the values.
for y=4:ny
    for x=4:nx
        bestDisparity=0;
        bestNCC=0;
        for disp=1:DISPARITY_RANGE
            dy=y-EXTEND;
            uy=y+EXTEND;
            lx=x-EXTEND;
            rx=x+EXTEND;
            ldx=x-disp-EXTEND;
            rdx=x-disp+EXTEND;
            if ldx>=1
                if rdx<=nx
                    Patch1 = Ileft(dy:uy,lx:rx);
                    Patch2 = Iright(dy:uy,ldx:rdx);
                else
                    break                    
                end
            else
                break
            end
            %currNCC = normxcorr2(Patch1,Patch2);
            new_patch1 = zeros(5,5);
            new_patch2 = zeros(5,5);
            for i=1:5
                for j=1:5
                    new_patch1(i,j)=Patch1(i,j);
                    new_patch2(i,j)=Patch2(i,j);
                end
            end
            num=sum(sum(times(new_patch1,new_patch2)));
            sqr_patch1=sqrt(sum(sum(new_patch1.^2)));
            sqr_patch2=sqrt(sum(sum(new_patch2.^2)));
            den=sqr_patch1*sqr_patch2;
            currNCC=num/den;
            if currNCC>bestNCC
                bestNCC=currNCC;
                bestDisparity=disp;
            end
        end
        disparity(y,x)=bestDisparity;
    end
    
end
d1=mat2gray(disparity);
imshow(d1)
%imwrite(disparity, strcat('Outputs\stereo_',fileName1));
%imwrite(disparity,'Outputs\stereo1.png','png');
end
