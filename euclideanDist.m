function result = euclideanDist(testFea, trainFea, labelTrain)
N = size(testFea, 1);
result = zeros(N,1);
L = length(labelTrain);
for i = 1:N
 dist = sqrt(sum((trainFea - ones(L,1)*testFea(i,:)).^2,2));
 [v idx] = min(dist,[],1);
 result(i) = labelTrain(idx);
end
