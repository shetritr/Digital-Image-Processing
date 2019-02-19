clear all;

%% step 1 :  split to categories
rootFolder = fullfile("", 'ObjectCategories'); % define output folder

% %%%%%%%%%%%%%%%%%%%%%%% add new label == folder name
categories = {'b','n',  'pp','kk','qq','rr','ee','e','bb','nn','p','q','r','k'};

% %%%%%%%%%%%%%%%%%%%%%%
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource', 'foldernames');
tbl = countEachLabel(imds)

%% step 2: Separate the sets into training and validation data (30% and 70%)

%%%%%%%%%%%%%%%% for slit fot valid and train
%%[trainingSet, validationSet] = splitEachLabel(imds, 0.7, 'randomize');
%%%%%%%%%%%%%%%%%%%%

 trainingSet = imds;
 validationSet = imds;

%% step 3: Create a Visual Vocabulary and Train an Image Category Classifier
extractor = @exampleBagOfFeaturesExtractor;
bag = bagOfFeatures(imds);

%% Training an image category classifier for 3 categories.
%%%%%%%%%% create new categoryClassifier and save it
categoryClassifier = trainImageCategoryClassifier(trainingSet, bag);
save categoryClassifier;
%% Test with the trainingSet and validationSet

%%%%%%%%%%%%%%%%%%%%%%%  test 

confMatrix = evaluate(categoryClassifier, trainingSet);

confMatrix = evaluate(categoryClassifier, validationSet);


