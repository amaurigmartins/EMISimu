function [out] = getTranspositionScheme(app)

out=valIfTrue(app,app.UntransposedButton.Value==1,0,valIfTrue(app,app.L3L3L3Button.Value==1,1,2));
% 0 = untransposed
% 1 = L/3 L/3 L/3
% 2 = L/6 L/3 L/3 L/6
end

