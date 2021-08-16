function out = getLoadConnecType(app,circuit)

if circuit == 1
    out = app.LoadConnectionC1T2.Text;
else
    out = app.LoadConnectionC2T2.Text;
end

end