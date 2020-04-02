function [index] = getNearest(distances)
smallest = cell2mat(distances(1));
index = 1;
for i = 1:100
    if cell2mat(distances(i)) < smallest
        smallest = cell2mat(distances(i));
        index = i;
    end
end

end

