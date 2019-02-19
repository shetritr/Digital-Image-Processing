function [label] = classif(img)
%CLASSIF Summary of this function goes here
%   Detailed explanation goes here
    load('categoryClassifier.mat');
    [labelIdx, scores] = predict(categoryClassifier, img);
    % Display the string label
    label = categoryClassifier.Labels(labelIdx);
end

