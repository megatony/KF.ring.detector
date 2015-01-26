function separatedImage = getKFRing(Region,image_org,intensity)
mode = 1;
[column,row] = size(Region);
ring_y = uint32(column/2);
ring_x = uint32(row/2);
for index = ring_y:column
if(~(Region(index,ring_x) > ( Region(index-1,ring_x) - intensity ) && Region(index,ring_x) < ( Region(index-1,ring_x) + intensity )))
if(mode == 1)
mode = 2;
%region1Value = Region(index - 1,ring_x);
elseif(mode == 2)
mode = 3;
%region2Value = Region(index - 1,ring_x);
elseif(mode == 3)
mode = 0;
region3Value = Region(index - 1,ring_x);
ring_y = index - 1;
end
end
end
%%%
separatedImage = zeros(ring_y,ring_x);
[column,row] = size(Region);
for index_c = 1:column
for index_r = 1:row
if((Region(index_c,index_r) > region3Value - intensity) && (Region(index_c,index_r) < region3Value + intensity))
%if(Region(index_c,index_r) == region3Value)
separatedImage(index_c,index_r) = image_org(index_c,index_r);
else
separatedImage(index_c,index_r) = 0;
end
end
end
imshow(uint8(separatedImage));