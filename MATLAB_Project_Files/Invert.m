function [invertedImage] = Invert(image)
%Invert converts the supplied image (RGB or greyscale) to its opposite colours
%(complementary hues) and returns the inverted image
% Inputs:
%   image: an m-by-n-by-k uint8 array representing an RGB or greyscale 
%   colour image
% Outputs:
%   invertedImage: an m-by-n-by-k uint8 array representing the inverted
%   image
%Convert image to double to prevent premature rounding
image = double(image);

%Extract the dimensions of the image
[rows, columns, colours] = size(image);

%Initialise invertedImage
invertedImage = zeros(rows, columns, colours);

%Decide if the image is greyscale or RGB
if (colours == 1)
    %Image is greyscale
    %Iterate through each element of the array
    for i = 1:rows
        for j = 1: columns
            %Calculate the opposite colour value for the image
            invertedImage(i, j) = 255 - image(i, j);
        end
    end
else 
    %Image is RGB
    %Iterate through each element of the array
    for i = 1:rows
        for j = 1: columns
            %Calculate the opposite colour value for the image
            invertedImage(i, j, 1) = 255 - image(i, j, 1);
            invertedImage(i, j, 2) = 255 - image(i, j, 2);
            invertedImage(i, j, 3) = 255 - image(i, j, 3);
        end
    end
end

%Convert invertedImage to uint8
invertedImage = uint8(invertedImage);
end