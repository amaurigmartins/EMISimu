function out = outputPhaseVolt(app,this_term)

out=false;
if this_term==1
    out=app.Terminal1phasevoltages.Value;
elseif this_term==2
    out=app.Terminal2phasevoltages.Value;
end

end