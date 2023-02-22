function result = drawTree(parents, names)
    rootIndex = find(parents == -1); % find the root index
    result = drawSubtree(rootIndex, 0, parents, names);
end

function result = drawSubtree(index, depth, parents, names)
    if isempty(index)
        result = "";
        return;
    end
    
    result = [indent(depth), "+-", names{index}];
    
    children = find(parents == index);
    if ~isempty(children)
        for i = 1:length(children)
            childIndex = children(i);
            childResult = drawSubtree(childIndex, depth+2, parents, names);
            childResult = addVerticalPipes(childResult, depth+2);
            result = [result, newline, childResult];
        end
    end
end

function result = indent(depth)
    result = repmat(" ", 1, depth);
end

function result = addVerticalPipes(lines, depth)
    indent = repmat(' ', 1, depth);
    result = cell(size(lines));
    for i = 1:numel(lines)
        result{i} = [indent, '|', lines{i}(depth+1:end)];
    end
end




