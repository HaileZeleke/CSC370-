function sorted_dirs = Dirsort(dirs)
% Split each directory into its individual components
components = cellfun(@(dir) strsplit(dir, '/'), dirs, 'UniformOutput', false);

% Determine the depth of each directory (i.e., how many components it has)
depths = cellfun(@length, components);

% Pad all cell arrays to ensure they have the same size
max_depth = max(depths);
for i = 1:numel(components)
    pad_size = max_depth - length(components{i});
    if pad_size > 0
        components{i} = [components{i} repmat({''}, [1, pad_size])];
    end
end

% Concatenate depths and components into a cell array of cell arrays
concatenated = cell(size(depths));
for ii = 1:numel(depths)
    concatenated{ii} = [{depths(ii)}, components{ii}];
end

% Sort the concatenated cell array by depth first, and then lexicographically for each depth
[~, order] = sortrows(vertcat(concatenated{:}));

% Reassemble the sorted directories as strings and return the result
sorted_dirs = cellfun(@(idx) strjoin(components{idx}(1:depths(idx)), '/'), num2cell(order), 'UniformOutput', false);
end


% function sorted_dirs = Dirsort(dirs)
%     % Check that all elements of dirs are strings
%     if ~all(isstring(dirs))
%         error('All elements of dirs must be strings');
%     end
% 
%     % Split directories into components and determine their depth
%     components = cellfun(@(d) split(d, '/'), dirs, 'UniformOutput', false);
%     depths = cellfun(@(c) numel(c)-1, components);
% 
%     % Concatenate the depth and component data and sort the rows
%     data = [num2cell(depths.'), components.'];
%     [~, order] = sortrows(data, [1, 2:numel(components)+1]);
% 
%     % Reorder the original directory array
%     sorted_dirs = dirs(order);
% end



% function sorted_dirs = Dirsort(dirs)
%     [~, order] = sort( ...
%         arrayfun(@(d) sum(d=='/'), dirs), 'descend');
%     sorted_dirs = dirs(order);
% end



