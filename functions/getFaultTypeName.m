function out = getFaultTypeName(app)

ftype=split(app.FaultType.Text,' - ');  
    
out=string(ftype(2));

end