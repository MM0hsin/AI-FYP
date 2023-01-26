carData;
carDataFinalRand = carDataFinal(randperm(size(carDataFinal,1)), :);
r = corrplot(carDataFinalRand);

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

model = fitlm(Xtrain,Ytrain);

Z = [];
for i =1:size(X1)
    Z(i) = predict(model,X1(i,:));
end
Z = fix([Z.',Y,Y-Z.']);

