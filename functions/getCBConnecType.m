function out = getCBConnecType(app,circuit)

if circuit == 1
    out = app.CBConnectionC1.Text;
else
    out = app.CBConnectionC2.Text;
end

end