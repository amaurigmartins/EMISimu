function out = NRMSE(data,estimate)

out = sqrt(mean((data-estimate).^2))/(max(data)-min(data))*100;

end