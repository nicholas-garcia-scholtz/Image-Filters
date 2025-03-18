function [greyPic] = Greyscale(pic)
%Greyscale converts the supplied RGB colour image to a greyscale version by 
%applying a ratio of colours for each pixel.
% Inputs:
%   pic: an m-by-n-by-3 uint8 array representing an RGB colour image
% Outputs:
%   greyPic: an m-by-n-by-1 uint8 array representing a greyscale image

%Convert pic to double to prevent premature rounding
pic = double(pic);

%Extract the dimensions of the image
[rows, columns, colours] = size(pic);

%Initialise greyPic
greyPic = zeros(rows, columns);

%Iterate through each element of the array
for i = 1:rows
    for j = 1: columns
        %Apply our 3:5:1 ratio to each pixel
        greyPic(i, j) = (3/9)*pic(i, j, 1)+(5/9)*pic(i, j, 2)+(1/9)*pic(i, j, 3);
    end
end

%Convert greyPic to uint8
greyPic = uint8(greyPic);

end