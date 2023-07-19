clc,clear,close all;
pkg load image;

% Train Data
dirTrain = 'images\train\';
trainImg = dir(strcat(dirTrain,'\*.jpg'));
trainFeature =[];
for i = 1:numel(trainImg)
 im = imread(strcat(dirTrain,trainImg(i).name));
 grayIm = rgb2gray(im);
 grayImResize = imresize(grayIm,[256 256]);
 extractTrainFeature = extractLocalFeature(grayImResize);
 trainFeature = [trainFeature;extractTrainFeature];
end
% Label 1 is Normal and Label 2 is Glaucomatous
labelTrain = ones(564,1);
labelTrain(248:end) = 2;

% Test Data
dirTest = 'images\test\';
testImg = dir(strcat(dirTest,'\*.jpg'));
testFeature =[];
for i = 1:numel(testImg)
 im = imread(strcat(dirTest,testImg(i).name));
 grayIm = rgb2gray(im);
 grayImResize = imresize(grayIm,[256 256]);
 extractTestFeature = extractLocalFeature(grayImResize);
 testFeature = [testFeature;extractTestFeature];
end
% Label 1 is Normal and Label 2 is Glaucomatous
labelTest = ones(141,1);
labelTest(63:end) = 2;

% Classification
result = euclideanDist(testFeature,trainFeature,labelTrain);
% Accuracy
accuracy = sum((result-labelTest)==0)*100/numel(labelTest);
% Show Message Box
msg = sprintf('Image Classification Accuracy is %.3f', accuracy);
show = msgbox(msg);
