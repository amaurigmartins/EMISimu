function results = valueIfTrue(test,valtrue,valfalse)
results=[];
if test
    results=valtrue;
else
    results=valfalse;
end
end