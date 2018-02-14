addpath(genpath('Functions'))

% line detection
image1 = CV_1('Inputs\Q1\lineDetect1.bmp');
imwrite(image1,'Outputs\Q1\lineDetect1.bmp','bmp');
image2 = CV_1('Inputs\Q1\lineDetect2.bmp');
imwrite(image2,'Outputs\Q1\lineDetect2.bmp','bmp');
image3 = CV_1('Inputs\Q1\lineDetect3.bmp');
imwrite(image3,'Outputs\Q1\lineDetect3.bmp','bmp');

% segmentation
image4 = CV_2('Inputs\Q2\detectSky1.bmp');
imwrite(image4,'Outputs\Q2\segmentedSky1.bmp','bmp');
image5 = CV_2('Inputs\Q2\detectSky2.bmp');
imwrite(image5,'Outputs\Q2\segmentedSky2.bmp','bmp');
image6 = CV_2('Inputs\Q2\detectSky3.bmp');
imwrite(image6,'Outputs\Q2\segmentedSky3.bmp','bmp');

% stereo reconstruction
image7 = CV_3('Inputs\Q3\left1.png','Inputs\Q3\right1.png');
imwrite(image7,'Outputs\Q3\stereo1.png','png');
image8 = CV_3('Inputs\Q3\left2.png','Inputs\Q3\right2.png');
imwrite(image8,'Outputs\Q3\stereo2.png','png');
image9 = CV_3('Inputs\Q3\left3.bmp','Inputs\Q3\right3.bmp');
imwrite(image9,'Outputs\Q3\stereo3.bmp','bmp');