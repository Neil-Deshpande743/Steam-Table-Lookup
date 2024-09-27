function state = stateSat(indep, val, data)

    var_map = containers.Map({'T', 'P'}, [1, 2]);

    col = var_map(indep);

    % Check if the input value is within the range of the data
    if val < min(data(:, col)) || val > max(data(:, col))
        error('Input value is out of range.');
    end

    % Interpolate the data to find the corresponding state vector
    state = interp1(data(:,col), data(:,:), val, 'linear');

    if isempty(state)
        error('Interpolation failed.');
    end
end