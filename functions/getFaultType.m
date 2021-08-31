function out = getFaultType(app)

if isFaultStudy(app)
    ftype=split(app.FaultType.Text,' - ');  

    out=str2double(ftype(1));
else
    out = 0;
end

end