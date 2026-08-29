function neighborCell = makeNeighborCell(data, epsRadius)
numPts = size(data, 1);
neighborCell = cell(numPts, 1);
eps2 = epsRadius^2;

for i = 1:numPts
    diffData = bsxfun(@minus, data, data(i, :));
    dist2 = sum(diffData.^2, 2);
    neighborCell{i} = find(dist2 <= eps2)';
end
end