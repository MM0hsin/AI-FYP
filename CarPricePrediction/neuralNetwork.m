% carData;
% carDataFinalRand = carDataFinal(randperm(size(carDataFinal,1)), :);
% r = corrplot(carDataFinalRand);

X1 = table2array([carDataFinalRand(:,"year"), ...
    carDataFinalRand(:,"mileage"), ...
    carDataFinalRand(:,"tax"), ...
    carDataFinalRand(:,"mpg"),...
    carDataFinalRand(:,"engineSize"), ...
    carDataFinalRand(:,"automatic"),...
    carDataFinalRand(:,"fuelType")]);
Y = table2array([carDataFinalRand(:,"price")]);

Xtrain = [X1(1:1000,1), X1(1:1000,2), X1(1:1000,3), ...
    X1(1:1000,4), X1(1:1000,5), X1(1:1000,6), X1(1:1000,7)];
Ytrain = table2array([carDataFinalRand(1:1000,"price")]);

net = newff(Xtrain,Ytrain,[10,10],{'tansig','purelin'},'trainlm');
net.trainParam.show = 50;
net.trainParam.lr = 0.05;
net.trainParam.epochs = 300;
net.trainParam.goal = 1e-5;

size(Xtrain)
size(Ytrain)
Xtrain = Xtrain.';
Ytrain = Ytrain.';


[net, tr] = train(net,Xtrain,Ytrain);
% a = sim(net,carTrainMatrix);
