function JA = JAverage(class_map, Region);
% Calculate a J over each segmented region
% Qinpei 
% input: Region: segmented result, contains different segments
%        class_map: the original class map
% output: J average value -- higher value indicates classess separated
%                         -- lower value indicates compactness

% NOTE: make sure the class_map starts from 1.


[m, n] = size(Region);
N = m*n;
JA = 0;
for l = 1: max(Region(:)),
    % calculate J value for each region
    TRegion = zeros(m, n);
    [x,y] = find(Region == l); 
    xxx = find(Region == l);
    if isempty(x) 
        continue;
    end
    TRegion(xxx) = class_map(xxx);
    St = 0;
    % mean vector of the vectors with class label l
    z = [x y];
    M = mean(z);
    for i = 1:length(z),
        m2 = repmat(M, length(z), 1);
        St = sum(diag(sqdist(z', m2')));
    end
    J = JCalculation(TRegion, M, St);
    JA = JA + J*length(z);
end
JA = JA/max(Region(:));


        
