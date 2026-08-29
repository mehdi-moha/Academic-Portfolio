function data = makeSpiralData()
spiralNum = 450;
t = linspace(1.0, 4*pi, spiralNum)';
r = 0.45 * t;

x1 = r .* cos(t);
y1 = r .* sin(t);

x2 = r .* cos(t+pi);
y2 = r .* sin(t+pi);

spiralData1 = [x1, y1];
spiralData2 = [x2, y2];

spiralData1 = spiralData1 + 0.03 * randn(size(spiralData1));
spiralData2 = spiralData2 + 0.03 * randn(size(spiralData2));

noiseNum = 25;
noiseData = -6 + 12 * rand(noiseNum, 2);

data = [spiralData1; spiralData2; noiseData];
end