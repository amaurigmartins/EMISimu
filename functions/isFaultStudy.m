function out = isFaultStudy(app)

fault_type = getFaultType(app);

if fault_type == 0
    out = false;
else
    out = true;
end

end