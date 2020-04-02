function finalvector = getCenteroid(blocks)

[row, col] = size(blocks);

finalvector = {};
for i = 1:row
    for j = 1:col
        temp = cell2mat(blocks(i,j));
        [x ,y] = size(temp);
        
        F = getF_of_x(temp);
        sum1 = 0;
        sum2 = 0;
        for k = 1:x
            for m = 1:y
                sum1 = sum1 + k*temp(k,m);
                sum2 = sum2 + m*temp(k,m);
            end
        end
        if F == 0
            xdash = 0;
            ydash = 0;
        
        else
            xdash = sum1 / F;
            ydash = sum2 / F;
        end
        finalvector = [finalvector , xdash/x];
        finalvector = [finalvector , ydash/y];
    end
end


end

