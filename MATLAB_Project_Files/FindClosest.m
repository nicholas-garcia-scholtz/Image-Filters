function [closestPixel] = FindClosest(position, rPixels, cPixels)
%FindClosest finds the closest pixel from the given row and column co-ordinates
% Inputs:
%   position: a 1-by-2 double vector representing the position of a pixel.
%   rPixels: a 1-by-n double array representing the row co-ordinates of a set of pixels
%   cPixels: a 1-by-n double array representing the column co-ordinates of a set of pixels
% Outputs:
%   closestPixel: a 1-by-2 double vector representing the position of the closest pixel co-ordinates to the input position
% Author: Nicholas Garcia-Scholtz

%Find the length of the array
n = length(rPixels);

%Assign closest with the first pixel position distance
closest = sqrt((position(1, 1) - rPixels(1,1))^2 + (position(1,2) - cPixels(1,1))^2);

%Assign the closest pixel with the first pixel position
closestPixel(1,:) = [rPixels(1,1) cPixels(1,1)];

for i = 2:n
    %Calculate the pixel position distance
    diff = sqrt((position(1, 1) - rPixels(1,i))^2 + (position(1,2) - cPixels(1,i))^2);

    if (diff < closest)
        %If the distance is shorter, update the variables
        closest = diff;
        closestPixel(1,:) = [rPixels(1,i) cPixels(1,i)];
    end
end
end