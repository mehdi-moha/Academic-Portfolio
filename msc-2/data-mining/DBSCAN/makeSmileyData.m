function data = makeSmileyData()
faceNum = 180;
faceAngle = linspace(0, 2*pi, faceNum+1)';
faceAngle(end) = [];
faceRadius = 5;
faceX = faceRadius * cos(faceAngle);
faceY = faceRadius * sin(faceAngle);

faceData = [faceX, faceY];
faceData = faceData + 0.05 * randn(size(faceData));

eyeNum = 35;
leftEyeCenter = [-1.6, 1.5];
rightEyeCenter = [1.6, 1.5];

leftEyeData = 0.18 * randn(eyeNum, 2) + repmat(leftEyeCenter, eyeNum, 1);
rightEyeData = 0.18 * randn(eyeNum, 2) + repmat(rightEyeCenter, eyeNum, 1);

mouthNum = 90;
mouthAngle = linspace(200*pi/180, 340*pi/180, mouthNum)';
mouthRadius = 2.4;
mouthX = mouthRadius * cos(mouthAngle);
mouthY = mouthRadius * sin(mouthAngle) - 0.4;

mouthData = [mouthX, mouthY];
mouthData = mouthData + 0.04 * randn(size(mouthData));

noiseNum = 15;
noiseData = -6 + 12 * rand(noiseNum, 2);

data = [faceData; leftEyeData; rightEyeData; mouthData; noiseData];
end