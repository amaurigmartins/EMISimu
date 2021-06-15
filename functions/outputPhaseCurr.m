function out = outputPhaseCurr(app,this_term)

out=false;
if this_term==1
    out=app.Terminal1phasecurrentsCheckBox.Value;
elseif this_term==2
    out=app.Terminal2phasecurrentsCheckBox.Value;
end

end