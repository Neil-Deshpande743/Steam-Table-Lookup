function state_vector = stateLookup(indep1, val1, indep2, val2, data)

    % Map the variable names to column indices
    var_map = containers.Map({'T', 'P', '\rho', 'v', 'u', 'h', 's'}, [1, 2, 3, 4, 5, 6, 7]);
    
    % Get the column indices for the independent variables
    col1 = var_map(indep1);
    col2 = var_map(indep2);
    
    % Find the rows that match the input values
    idx1 = abs(data(:, col1) - val1) < 1e-6;
    idx2 = abs(data(:, col2) - val2) < 1e-6;
    idx = idx1 & idx2;
    
    if any(idx)
        % If an exact match is found, return the corresponding state vector
        state_vector = data(idx, :);
    else
        % If no exact match is found, use interpolation
        state_vector = interp2(data(:, col1), data(:, col2), data(:, :), val1, val2);
    end
end
