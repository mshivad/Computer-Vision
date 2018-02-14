function new = CV_1(fileName)
%function [] = CV_1(fileName)

%read the image into matlab
%I= imread('lineDetect1.bmp');
I= imread(fileName);
%I= imread('lineDetect3.bmp');

%convert the rgb component of the image to gray scale and extract the edges
%using canny method.
I=rgb2gray(I);
I_edge=edge(I,'canny',.1);
%I_edge=edge(I,'canny');

%intializing variables and limiting the max_iteration to 2000
edgeset={};
max_iter=2000;
line_set={};
inliner={};
pos=[];

%forming the edgeset
for i=1:1080
    for j=1:1920
        if I_edge(i,j)==1
            edgeset{end+1}=[i,j];
        end
    end    
end

q1=numel(edgeset);
%imshow(I_edge)

%initialising counters
count=0;
iter=0;
inline_nos=0;

%RANSAC algorithm
while iter<=max_iter
    q=1;
    a= edgeset{randi(q1,1)};
    %a(:,[1,2])=a(:,[2,1]);
    b= edgeset{randi(q1,1)};
    %b(:,[1,2])=b(:,[2,1]);
    a(:,[1,2])=a(:,[2,1]);
    b(:,[1,2])=b(:,[2,1]);
    dist=pdist([a;b],'euclidean');
    
    if dist<=100
        iter=iter+1;
        %count=count+1;
         %a(:,[1,2])=a(:,[2,1]);
         %b(:,[1,2])=b(:,[2,1]);
         a1 = a-b;
         a1(3)=0;
        %coeff=polyfit([a(1),b(1)],[a(2),b(2)],1);
        while q<q1
             c=edgeset{q};
             c(:,[1,2])=c(:,[2,1]);
             b1 = c - b;
             b1(3)=0;
             pldist=norm(cross(a1,b1))/norm(a1);
             %pldist = (c(1)-a(1))*(b(2)-a(2))-(c(2)-a(2))*(b(1)-a(1));
             dotpldist=dot(a1,b1);
             
                       if abs(pldist)<=1 
                          c(:,[1,2])=c(:,[2,1]);
                           inliner{end+1}=c;
                           %pos(end+1)=q;
                           if (dotpldist>0 && dotpldist<(dist*dist))
                                inline_nos=inline_nos+1;
                                 
                           
                                
                           end
                       end
        
             
              q=q+1;
             
        end
         if inline_nos>=50
                        %imshow(I_edge)
                        %hold on
                        %plot([a(2),b(2)],[a(1),b(1)],'Linewidth',2)
                        %a(:,[1,2])=a(:,[2,1]);
                        %b(:,[1,2])=b(:,[2,1]);
                        line_set{end+1}=inliner;
                        inliner={};
                        inline_nos=0;
%                         for num=1:numel(pos)
%                             edgeset(pos(num))=[];
%                         end
                        %pos=[];
                        q1=numel(edgeset);
         else
              inliner={};
              inline_nos=0;
              %pos=[];
         end
    end
end

%plotting the final image
img=zeros(1080,1920);
for z=1:q1
    b=edgeset{z};
    b1=b(1);
    b2=b(2);
    img(b1,b2)=1;

end
imshow(img)
hold on

for k=1:(numel(line_set))
    inl=line_set{k};
    clr=abs(rand(1,3));
    for m=1:numel(inl)
    pnt=inl{m};
    plot(pnt(2),pnt(1),'.','color',clr,'Linewidth',2)
    hold on
    end
end
    f=getframe(gcf);
    new=f.cdata;
end

%for k=1:(numel(line_set))
    %inl=line_set{k};
    %clr=abs(rand(1,3));
    %   pnty1=pnt(1);
        %pntx1=pnt(2);
        %pnty2=pnt(3);
        %pntx2=inl(4);
        %plot([pntx1,pntx2],[pnty1,pnty2],'color',clr,'Linewidth',2)
        %hold on
   
       

%end

        

                  
        
