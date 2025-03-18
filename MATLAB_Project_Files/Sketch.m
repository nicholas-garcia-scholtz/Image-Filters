function [skchImg] = Sketch(img, intensity)
%Sketch takes an image and converts it into a sketch-like drawing by using a combination of greyscale, inversion and blurring
% Inputs:
%   img: an m-by-n-by-k uint8 array representing an RGB or greyscale colour image
%   intensity: a positive, odd, integer that defines the intensity of the sketch lines (used for blurring)
% Outputs:
%   skchImg: an m-by-n-by-1 uint8 array representing the sketch-like image
% Author: Nicholas Garcia-Scholtz

%Extract the dimensions of the image
[rows, columns, colours] = size(img);

if (colours == 1)
    %img is grey scale, so no function need to convert it
    greyImg = img;
else
    %img is RGB, so we need to convert it to grey scale
    greyImg = Greyscale(img);
end

%Blurred and inverted the greyscale image according to the given intensity
tempImg = Blur(Invert(greyImg), intensity); 

%Convert greyImg to double to prevent rounding errors
greyImg = double(greyImg);

%Convert tempImg to double to prevent rounding errors
tempImg = double(tempImg);

%Initialise skchImg
skchImg = zeros(rows, columns);

for i = 1:rows
    for j = 1:columns
        if (greyImg(i,j) == 255)
            %Prevent dividing by 0 using the colour dodge approach formula
            skchImg(i,j) = 255;
        else
            %Using the colour dodge approach formula
            skchImg(i,j) = (255*tempImg(i,j))/(255-greyImg(i,j));
        end
    end
end

skchImg = uint8(skchImg);
end