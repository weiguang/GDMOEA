function GD = CalculateGD(PF,fit)
% calculate GD metric 
% fit: popSize*M     
% PF: pfSize*M

[popSize, M]= size(fit);  
pfSize =  size(PF,1);

for i=1:popSize
  for j=1:pfSize
      D(i,j) = norm(fit(i,:)-PF(j,:),2); 
  end
  Dmin(i,:) = min(D(i,:));   
end

GD = sqrt(sum(Dmin.^2))/popSize;

end

