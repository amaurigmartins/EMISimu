function [out] = modprin(len,num)

y=prin(['%' sprintf('%d',len) 'V'], num);

k = strfind(y,'e');

if ~isempty(k)
    
    y=prin(['%' sprintf('%d',len) 'v'], num);
    k = strfind(y,'e');
    substr=y(1:k-1);
    kk=strfind(substr,'.');
    
    if ~isempty(kk)
        num_after_dot=length(substr(kk+1:end));
        pow=y(k+1:end);
        newpow=num2str(str2num(pow)-num_after_dot + 1);
        substr=erase(substr,'.');
        substr = substr(1:end-1);
        abspow = abs(str2num(pow));
        absnewpow = abs(str2num(newpow));
        if (abspow < 10)
            if(absnewpow > 9)
                substr = substr(1:end-1);
                newpow=num2str(str2num(pow)-num_after_dot +2);
            end
        end
    end  
        y = [substr '.e' newpow];
end

if str2num(y) > 0 && str2num(y) < 1 && strfind(y,'.') == 1
    y = ['0' y(1:end-1)];
elseif str2num(y) < 0 && str2num(y) > -1 && strfind(y,'.') == 2
    y = ['-0' y(2:end-1)];
end

if len ~=length(y)
 y = [' ' y];
end



out=y;

end