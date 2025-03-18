function [crystalImg] = Crystallise(img, crystal_rows, crystal_columns)
%Crystallise applies a frosted window or mosaic-like filter to the input image
% Inputs:
%   img: an m-by-n-by-3 uint8 array representing an RGB image
%   crystal_rows: a 1-by-n double array representing the row co-ordinates of each crystal
%   crystal_columns: a 1-by-n double array representing the column co-ordinates of each crystal
% Outputs:
%   crystalImg: an m-by-n-by-3 uint8 array representing the crystallised image
% Author: Nicholas Garcia-Scholtz

%Convert img to double
img = double(img);

%Extract the dimensions of img
[m,n,rgb] = size(img);

%Initialise cyrstalImg
crystalImg = zeros(m, n, rgb);

%Initialise the position vector which will hold the closest crystal
%location
P = zeros(1, 2);

for i = 1:m
    for j = 1:n
        %Retrieve the colour from at the crystal location and replace the
        %colour at the position with the crystal colour
        P(1,:) = FindClosest([i j], crystal_rows, crystal_columns);
        crystalImg(i,j,:) = img(P(1,1), P(1,2), :);
    end
end

%Convert crystalImg to uint8
crystalImg = uint8(crystalImg);

end