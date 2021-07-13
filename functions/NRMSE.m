function out = NRMSE(data,estimate)

out = sqrt(mean((data-estimate).^2))/(max(estimate)-min(estimate));

end