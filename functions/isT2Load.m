function out = isT2Load(app,circuit)

if circuit == 1
    out = strcmp(app.C1T2Type.Text,'load');
else % circuit == 2
    out = strcmp(app.C2T2Type.Text,'load');
end

end