function [blurredImg] = Blur(img, intensity)
%Blur blurs the supplied image (RGB or greyscale) by finding an average of 
%the pixel colours surrounding each pixel.
% Inputs:
%   img: an m-by-n-by-k uint8 array representing an RGB or greyscale image
%   intensity: a positive, odd, integer that defines the intensity of the
%   blurring
% Outputs:
%   blurredImg: an m-by-n-by-k uint8 array representing the blurred image
% Author: Nicholas Garcia-Scholtz
%Convert img to a double to prevent premature rounding
img = double(img);

%Extract the dimensions of img
[rows, columns, colours] = size(img);

%Initialise blurredImg
blurredImg = zeros(rows, columns, colours);

%Variables used for indexes when blurring a pixel
startRow = 0;
startColumn = 0;

%Number of pixels summed
num = 0;


if (intensity == 1)
    %There is no blur
    blurredImg = img;
else 
    if (colours == 1)
        %Image is grey scale
        for i = 1:rows
            for j = 1:columns
                %Start positions
                startRow = i - 0.5 * (intensity - 1); 
                startColumn = j - 0.5 * (intensity - 1);

                for currentRow = startRow:(startRow + intensity - 1)
                    
                    %Out of bounds checks
                    if (currentRow > rows)
                        break;
                    elseif (currentRow < 1)
                        continue;
                    end
                    
                    for currentColumn = startColumn:(startColumn + intensity - 1)
                        
                        %Out of bounds checks
                        if (currentColumn > columns)
                            break;
                        elseif (currentColumn < 1)
                            continue;
                        end
                        blurredImg(i, j) = blurredImg(i, j) + img(currentRow, currentColumn);
                        
                        %Add to num when another pixel is used to calculate the blur
                        num = num + 1;
                    end
                end
                %Average colour of all the pixels in the square's range
                blurredImg(i,j) = blurredImg(i,j) / num;
                num = 0;
            end
        end

    else
        %Image is RGB
        for i = 1:rows
            for j = 1:columns
                %Start positions
                startRow = i - 0.5 * (intensity - 1); 
                startColumn = j - 0.5 * (intensity - 1);

                for currentRow = startRow:(startRow + intensity - 1)
                    
                    %Out of bounds checks
                    if (currentRow > rows)
                        break;
                    elseif (currentRow < 1)
                        continue;
                    end

                    for currentColumn = startColumn:(startColumn + intensity - 1)
                        
                        %Out of bounds checks
                        if (currentColumn > columns)
                            break;
                        elseif (currentColumn < 1)
                            continue;
                        end

                        blurredImg(i, j, 1) = blurredImg(i, j, 1) + img(currentRow, currentColumn, 1);
                        blurredImg(i, j, 2) = blurredImg(i, j, 2) + img(currentRow, currentColumn, 2);
                        blurredImg(i, j, 3) = blurredImg(i, j, 3) + img(currentRow, currentColumn, 3);
                        
                        %Add to num when another pixel is used to calculate the blur
                        num = num + 1;
                    end
                end
                %Average colour of all the pixels in the square's range
                blurredImg(i,j, 1) = blurredImg(i,j, 1) / num;
                blurredImg(i,j, 2) = blurredImg(i,j, 2) / num;
                blurredImg(i,j, 3) = blurredImg(i,j, 3) / num;
                num = 0;
            end
        end
    end
end

blurredImg = uint8(blurredImg);

end