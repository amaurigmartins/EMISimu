function results = valIfTrue(app,test,valtrue,valfalse)
            results=[];
            if test
                results=valtrue;
            else
                results=valfalse;
            end
end
        