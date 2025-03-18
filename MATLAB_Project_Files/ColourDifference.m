function [diff] = ColourDifference(p, q)
%ColourDifference is given two m-by-n-by-3 arrays and calculates the euclidean difference in colour between respective pixels in the two arrays
% Inputs:
%   p: an m-by-n-by-3 uint8 array representing one array of colours
%   q: an m-by-n-by-3 uint8 array representing a second array of colours
% Outputs:
%   diff: an m-by-n array of doubles representing the euclidean difference in colour between corresponding pixels of the inputs

%Convert the two arrays to doubles to prevent rounding errors
p = double(p);
q = double(q);

[m, n, colours] = size(p);

%Initialise diff
diff = zeros(m,n);

for i = 1:m
    for j = 1:n
        diff(i,j) = sqrt((q(i,j,1) - p(i,j,1))^2 + (q(i,j,2) - p(i,j,2))^2 + (q(i,j,3) - p(i,j,3))^2);
    end
end
end