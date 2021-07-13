function out = RMSE(data,estimate)

out = sqrt(mean((data-estimate).^2));

end