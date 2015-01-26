function goal = getKFPercent(comparisionImage,comparisionImage1)
[column,row] = size(comparisionImage);
pixelCount = 0;
for a = 1:column
for b = 1:row
if(comparisionImage(a,b) == comparisionImage1(a,b) && comparisionImage(a,b) ~= 0)
pixelCount = pixelCount + 1;
end
end
end
goal = (pixelCount/nnz(comparisionImage))*100;