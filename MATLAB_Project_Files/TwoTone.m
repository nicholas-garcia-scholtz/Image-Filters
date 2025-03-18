function [finalImg] = TwoTone(img, colours, weightings)
%TwoTone converts an image to use only two different colours
% Inputs:
%   img: an m-by-n-by-3 uint8 array representing an RGB image
%   colours: a 1-by-2-by-3 uint8 array representing two RGB pixel colours to be used in the output image
%   weightings: a 1-by-2-by-3 uint8 array representing wo RGB pixel colours to be used as weightings for determining which output colour to apply
% Outputs:
%   finalImg: an m-by-n-by-3 uint8 array representing the two toned output image
% Author: Nicholas Garcia-Scholtz

%Convert img to double to prevent rounding errors
img = double(img);

%Extract dimensions of the image
[rows, columns, RGB] = size(img);

%Initialize variables
low = zeros(rows, columns, RGB);
high = zeros(rows, columns, RGB);
finalImg = zeros(rows, columns, RGB);

%Assign weightings to high and low
for i = 1:rows
    for j = 1:columns
        low(i,j,:) = weightings(1,1,:);
        high(i,j,:) = weightings(1,2,:);
    end
end

%Calculate the colour differences for all pixel values for both low and high
lowDiff = ColourDifference(img, low);
highDiff = ColourDifference(img, high);

for i = 1:rows
    for j = 1:columns
        if (lowDiff(i,j) <= highDiff(i,j))
            %Pixels closer to low or with a the same colour difference
            %between low and high are assigned colourA
            finalImg(i,j,:) = colours(1,1,:);
        else
            %Pixels that are closer to high are to be replaced by colourB
            finalImg(i,j,:) = colours(1,2,:);
        end
    end
end

%Convert the final image from double to uint8
finalImg = uint8(finalImg);

end