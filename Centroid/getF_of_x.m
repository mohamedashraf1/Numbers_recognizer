function [sum] = getF_of_x(block)
sum = 0;
[x,y] = size(block);
for i = 1:x
    for j =1:y
        if block(i,j) == 1
            sum =sum + 1;
        end
    end
end

end

