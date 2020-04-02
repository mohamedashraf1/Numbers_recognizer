function [output] = train()

path = 'F:\college\third year\second term\Pattern recognition\assignment\Data Set (0-9)';

output = zeros(1,32,100);

counter = 1;
for i = 0:9 
    for j = 1:10
        img = imread(strcat(path,'\',int2str(i),'_',int2str(j),'.bmp'));
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
        
        
        if row/4 ~= floor(row/4)    
            row = row +10;
            
        end
        
        if column/4 ~= floor(column/4)
            column = column + 10;
            
        end
        
        img = imresize(img, [row column]);
        
        blocks = mat2tiles(img,[row/4, column/4]);
        
        finalvector = getCenteroid(blocks);
        tmp = cell2mat(finalvector);
        output(:,:,counter) = tmp;
        
        counter = counter + 1;
        
    end
    
end



end

