function comparisionImage = createComparisionImage(separatedImage)

comparisionImage1 = im2bw(separatedImage);
thickness = 0;
lastIndex_r = 0;
lastIndex_c = 0;
flag = true;
[column,row] = size(comparisionImage1);
r_index = uint32(row/2);
c_index_temp = uint32(column/2);
for c_index = c_index_temp:column
if(comparisionImage1(c_index,r_index) == 0 && flag == true)
%
elseif(comparisionImage1(c_index,r_index) ~= 0)
thickness = thickness + 1;
lastIndex_c = c_index;
lastIndex_r = r_index;
flag = false;
else
break;
end
end
radius = sqrt(((double(row/2) - double(lastIndex_r))^2 + (double(column/2) - double(lastIndex_c))^2));
%
width = row;
height = column;
centerW = width/2;
centerH = height/2;
[W,H] = meshgrid(1:width,1:height);
bigCircle = sqrt((W-centerW).^2 + (H-centerH).^2) < radius;
smallCircle = sqrt((W-centerW).^2 + (H-centerH).^2) < radius-thickness;
comparisionImage = bigCircle-smallCircle;
comparisionImage = im2bw(comparisionImage);