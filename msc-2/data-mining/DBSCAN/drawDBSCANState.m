function drawDBSCANState(pt, data, axisLimits, clusterNum, currentPoint, drawEvery, forceDraw, plotTitle)
persistent frameCounter colorList

if isempty(frameCounter) || (forceDraw && currentPoint == -1 && clusterNum == 0)
    frameCounter = 0;
    maxColorNum = 20;
    baseColorList = 0.60 * hsv(maxColorNum) + 0.40;

    oldRng = rng;
    rng('shuffle');
    colorOrder = randperm(maxColorNum);
    rng(oldRng);
    
    colorList = baseColorList(colorOrder, :);
end

if ~forceDraw
    frameCounter = frameCounter + 1;
    if drawEvery > 1 && mod(frameCounter, drawEvery) ~= 0
        return;
    end
end

cla;
hold on;
grid on;
axis equal;

clusterID = [pt.clusterID]';
isCore = [pt.isCore]';

xlim(axisLimits(1:2));
ylim(axisLimits(3:4));

title([plotTitle, ' - Number of clusters = ', num2str(clusterNum)]);
xlabel('x');
ylabel('y');

maxColorNum = size(colorList, 1);
unvisitedIndex = clusterID == 0;
scatter(data(unvisitedIndex, 1), data(unvisitedIndex, 2), 15, [0.88, 0.88, 0.90], 'filled', 'MarkerEdgeColor', 'none');

for c = 1:clusterNum
    thisColor = colorList(mod(c-1, maxColorNum)+1, :);

    borderIndex = clusterID == c & ~isCore;
    scatter(data(borderIndex, 1), data(borderIndex, 2), 22, thisColor, 'filled', 'MarkerEdgeColor', 'none');

    coreIndex = clusterID == c & isCore;
    scatter(data(coreIndex, 1), data(coreIndex, 2), 38, thisColor, 'filled', 'MarkerEdgeColor', 'none');
end

noiseIndex = clusterID == -1;
scatter(data(noiseIndex, 1), data(noiseIndex, 2), 35, [0.95, 0.45, 0.50], 'x', 'LineWidth', 1.2);

if currentPoint > 0
    scatter(data(currentPoint, 1), data(currentPoint, 2), 80, [1.00, 0.78, 0.35], 'filled', 'MarkerEdgeColor', 'none');
end

fastDraw();
end