function [ntg] = getNumTargets(app)
ntg=app.NumTargets.Value;

if ntg > 9
    error('Unable to run ATP solver! Target number higher than 9!');
end

end