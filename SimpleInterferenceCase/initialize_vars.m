

% Ground impedance data table convert:
app.UITableGroundImp.Data = num2cell(app.UITableGroundImp.Data);

% Tower to ground output specify sections table convert:
Tow2Ground_transf = cell2mat(struct2cell(app.Tow2Ground));
Tow2Ground_transf = struct2cell(Tow2Ground_transf);

Tow2Ground_Table(:,1) = Tow2Ground_transf(:,1,:);
Tow2Ground_Table(:,2) = Tow2Ground_transf(:,2,:);

app.UITableTow2Ground.Data = num2cell(Tow2Ground_Table);