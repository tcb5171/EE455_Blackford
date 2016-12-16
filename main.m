clear
clc
%%
first=imread('boat.gif');
[M, N] = size(first);
imtool(first);

for i=1:2:M
    for j=1:2:N % use for loops to index array for filtering
        newValue=0; %initalize the value to be inserted into new array to 0
        newValue = first(i,j);
        second(i:i+1,j:j+1)=newValue; %index new value into array for filtered image
    end
end
imtool(second);

for i=1:4:M
    for j=1:4:N % use for loops to index array for filtering
        newValue=0; %initalize the value to be inserted into new array to 0
        newValue = second(i,j);
        third(i:i+3,j:j+3)=newValue; %index new value into array for filtered image
    end
end
imtool(third);

for i=1:8:M
    for j=1:8:N % use for loops to index array for filtering
        newValue=0; %initalize the value to be inserted into new array to 0
        newValue = third(i,j); %pull new value for pixel grouping from upper left
        fourth(i:i+7,j:j+7)=newValue; %index new value into array for filtered image
    end
end
imtool(fourth);

%% 2
for i=1:4:M
    for j=1:4:N % use for loops to index array for filtering
        newValue=0; %initalize the value to be inserted into new array to 0
        newValue = first(i,j);
        interpre(floor((i+4)/4),floor((j+4)/4))=newValue; %index new value into array for filtered image
    end
end
imtool(interpre);
for i=1:63
    for j=1:63 % use for loops to index array for filtering
        newValue=0; %initalize the value to be inserted into new array to 0
        %f1=interpre(i,j)* ((j+1)-(j+.5)) + interpre(i,j+1)* ((j+.5)-(j+1));
        %f2=interpre(i+1,j)* ((j+1)-(j+.5)) + interpre(i+1,j+1)* ((j+.5)-(j+1));
        interpost(i,j)=interpre(i,j);
        interpost(i+2,j)=interpre(i+1,j);
        interpost(i,j+2)=interpre(i,j+1);
        interpost(i+2,j+2)=interpre(i+1,j+1);
        %newValue=f1*((i+1)-(i+.5)) + f2*((i+.5)-i);
        interpost(i+1,j)=(interpre(i,j)+interpre(i+1,j))/2;
        interpost(i,j+1)=(interpre(i,j)+interpre(i,j+1))/2;
        interpost(i+2,j+1)=(interpre(i+1,j)+interpre(i+1,j+1))/2;
        interpost(i+1,j+2)=(interpre(i,j+1)+interpre(i+1,j+1))/2;
      
        interpost(i+1,j+1)=(interpost(i+1,j+2)+interpost(i+2,j+1)+interpost(i,j+1)+interpost(i+1,j))/4;
    end
end
imtool(interpost, [0 255]);

%% 3

%8 bit
eightb=first;
imtool(eightb);
%6 bit
for x = 1 : M
    for y = 1 : N
        sixb(x,y) = first(x,y)/4;
        sixb(x,y) = sixb(x,y)*4;
    end
end
imtool(sixb, [0 255])
%4 bit
for x = 1 : M
    for y = 1 : N
        fourb(x,y) = first(x,y)/17;
        fourb(x,y) = fourb(x,y)*17;
    end
end
imtool(fourb, [0 255])
%2 bit
for x = 1 : M
    for y = 1 : N
        twob(x,y) = first(x,y)/85;%we use 85 since 255/3 is 85 and this will return us 2 bits (4 values) of color. Using 64 returned 5 colors.
        %twob(x,y) = twob(x,y)*85;
    end
end
imtool(twob, [0 3])
%1 bit/binary
for x = 1 : M
    for y = 1    
        oneb(x,y) = first(x,y)/128;%we use 85 since 255/3 is 85 and this will return us 2 bits (4 values) of color. Using 64 returned 5 colors.
        oneb(x,y) = oneb(x,y)*128;
    end
end

imtool(oneb, [0 255])
