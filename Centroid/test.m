function [num] = test(path,db)

img = imread(path);

%img = imbinarize(img);
if ~islogical(img)
    img = im2bw(img,0.5);
    
end

img = ~img;

[rows, columns] = find(img);
topRow = min(rows);
bottomRow = max(rows);
leftColumn = min(columns);
rightColumn = max(columns);
img = img(topRow:bottomRow, leftColumn:rightColumn);

[row ,column] = size(img);
row = ceil(row/10)*10;
column = ceil(column/10)*10;

img = imresize(img, [row,column]);

if row/4 ~= floor(row/4) 
    row = row +10;
end
if column/4 ~= floor(column/4)
    column = column + 10;
end

blocks = mat2tiles(img,[row/4, column/4]);

finalvector = getCenteroid(blocks);
finalvector = cell2mat(finalvector);

[vecrow , veccol] = size(finalvector);

dis = 0;
distances = {};
for i = 1:100
    for j = 1:vecrow*veccol
        dis = dis + (db(:,j,i) - finalvector(:,j)).^2 ;
    end
    
    dis = sqrt(dis);
    
 
    distances = [distances, dis];
    dis = 0;
end
index = getNearest(distances);
num = floor(index/10);

end