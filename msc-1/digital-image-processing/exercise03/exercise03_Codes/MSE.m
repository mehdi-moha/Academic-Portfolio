function [ mse ] = MSE(I,J)
mse=sum(sum((double(I)-double(J)).^2))/numel(J);
end