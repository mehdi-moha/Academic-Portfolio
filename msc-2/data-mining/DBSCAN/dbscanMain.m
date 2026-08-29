clc;
clear;
close all;

rng(2);

dataMode = 'smiley';
% dataMode = 'spiral';

if strcmp(dataMode, 'smiley')
    data = makeSmileyData();
    plotTitle = 'Animated DBSCAN - Smiley Face Data';
    epsRadius = 0.5;
    minPts = 5;
elseif strcmp(dataMode, 'spiral')
    data = makeSpiralData();
    plotTitle = 'Animated DBSCAN - Two Spiral Data';
    epsRadius = 0.4;
    minPts = 5;
else
    error('Wrong data mode selected.');
end

numPts = size(data, 1);
drawEvery = 10;
printLabels = true;

pt = repmat(struct('visited', false, 'isCore', false, 'clusterID', 0, 'type', 'unvisited'), numPts, 1);
neighborCell = makeNeighborCell(data, epsRadius);

axisLimits = [min(data(:, 1)) - 1, max(data(:, 1)) + 1, min(data(:, 2)) - 1, max(data(:, 2)) + 1];

figure;
drawDBSCANState(pt, data, axisLimits, 0, -1, drawEvery, true, plotTitle);
pause(0.5);

clusterNum = 0;
checkOrder = 1:numPts;

for i = 1:numPts
    p = checkOrder(i);

    if pt(p).visited
        continue;
    end
    
    pt(p).visited = true;
    neighborList = neighborCell{p};

    if numel(neighborList) < minPts
        pt(p).clusterID = -1;
        pt(p).type = 'noise';
        drawDBSCANState(pt, data, axisLimits, clusterNum, p, drawEvery, false, plotTitle);
    else
        clusterNum = clusterNum + 1;
        pt(p).isCore = true;
        pt(p).clusterID = clusterNum;
        pt(p).type = 'core';
        drawDBSCANState(pt, data, axisLimits, clusterNum, p, drawEvery, false, plotTitle);

        seedNeighbors = neighborList(neighborList ~= p);
        
        seedList = zeros(1, numPts);
        seedCount = numel(seedNeighbors);
        seedList(1:seedCount) = seedNeighbors;

        inSeedList = false(1, numPts);
        inSeedList(neighborList) = true;

        s = 1;
        while s <= seedCount
            q = seedList(s);

            if ~pt(q).visited
                pt(q).visited = true;
                neighborList2 = neighborCell{q};

                if numel(neighborList2) >= minPts
                    pt(q).isCore = true;
                    pt(q).type = 'core';

                    newPoints = neighborList2(~inSeedList(neighborList2));
                    newCount = numel(newPoints);

                    if newCount > 0
                        seedList(seedCount+1:seedCount+newCount) = newPoints;
                        inSeedList(newPoints) = true;
                        seedCount = seedCount + newCount;
                    end
                else
                    pt(q).type = 'border';
                end
            end

            if pt(q).clusterID <= 0
                pt(q).clusterID = clusterNum;
                
                if pt(q).isCore
                    pt(q).type = 'core';
                else
                    pt(q).type = 'border';
                end
                
                drawDBSCANState(pt, data, axisLimits, clusterNum, q, drawEvery, false, plotTitle);
            end
            
            s = s + 1;
        end
    end
end

drawDBSCANState(pt, data, axisLimits, clusterNum, -1, drawEvery, true, plotTitle);

fprintf('Number of clusters = %d\n\n', clusterNum);

if printLabels
    for i = 1:numPts
        fprintf('Point %3d : Cluster = %2d , Type = %s\n', i, pt(i).clusterID, pt(i).type);
    end
end