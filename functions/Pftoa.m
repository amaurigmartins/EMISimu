function s = Pftoa(fmtstr,val) % floating point to ascii convertion - called by prin.m
%
% Pftoa.m:  Alternative number conversion formatting - version 01Jan17
% Author:   Paul Mennen (paul@mennen.org)
%           Copyright (c) 2017, Paul Mennen
%
% function s = Pftoa(fmtstr,val)
% returns a string representing the number val using the format specified by fmtstr
%.
% fmtstr: format description string
% val:    the number to be converted to ascii
%
%
% fmtstr in the form '%nV' --------------------------------------------
% n: the field width
% s: the string representation of x with the maximum resolution possible
%    while using at exactly n characters.
%
% fmtstr in the form '%nv' ---------------------------------------------
% n: the field width, not counting decimal point (since it's so skinny)
% s: the string representation of x with the maximum resolution possible
%    while using at exactly n+1 characters. (If a decimal point is not
%    needed, then only n characters will be used).
%
% fmtstr in the form '%nW' ---------------------------------------------
% n: the field width
% s: the string representation of x with the maximum resolution possible
%    while using at most n characters.
%
% fmtstr in the form '%nw' ---------------------------------------------
% n: the field width, not counting decimal point (since it's so skinny)
% s: the string representation of x with the maximum resolution possible
%    while using at most n+1 characters.
%
% For any of the VWvw formats, if the field width is too small to allow
% even one significant digit, then '*' is returned.

% If the format code is not one of the four characters VWvw then use
% the sprintf c conventions: s=sprintf(fmtstr,number);
% e.g.  Pftoa('%7.2f',value) is identical to sprintf('%7.2f',value).

% Optional format modifiers are allowed between the % sign and the field width.
% An optional modifier is one of the characters "+-jJkL". The + and - modifiers
% control padding the output with blanks and the other four modifiers allow
% the conversion of complex numbers. These modifies are described fully in
% the prin.pdf help file.

% BACKGROUND: ---------------------------------------------------------------
% Pftoa() expands on the number conversion capabilities of sprintf's d,f,e,g
% conversion codes (which are identical to the c language conventions). These
% formats are ideal for many situations, however the fact that these formats
% will sometimes output more characters than the specified field width make
% them inappropriate when used to generate a number that is displayed in a
% fixed sized GUI element (such as an edit box) or in a table of numbers
% arranged in fixed width columns. This motivated the invention of Pftoa's new
% V and W formats. With the e & g formats one is often forced to specify a very
% small number of signifcant digits since otherwise on the possibly rare
% occations when the numbers are very big or very small an unintelligable
% display is produced in the GUI, or the generated table becomes hopelessly
% misallined. For example, suppose a column of numbers of width 8 characters
% normally contains numbers that look something like 1.234567 but could
% occationally contain a number such as 7.654321E-100. The best you could
      % do with a g format would be '%8.2g' which would produce the strings
% 1.2 and 7.6E-100 which means the numbers we see most often are truncated
% far more than necessary. Essentially with the e and g formats, you specify
% the precision you want and you accept whatever size string is produced.
% With the V and W formats, this is turned around. You specify the length
% of the string you want, and Pftoa supplies as much precision as possible
% with this constraint.
%
% For displaying columns of numbers (using a fixed spaced font) the V format
% is best since it always outputs a character string of the specified length.
% For example, the format string '%7V' will output seven characters. Never
% less and never more.
%
% For displaying a number in an edit box the W format is best. For example
% '%7W' will output at most seven characters, although it will output fewer
% than 7 characters if this does not reduce the precision of the output.
% For example, the integer "34" will be displayed with just two characters
% (instead of padding with blanks like the V format does). Since the text
% in an edit box is most often center aligned, this produces a more pleasing
% result. Using a lower case w (i.e. the '%7w' format) behaves similarly
% except that periods are not counted in the character count. This means
% that if a decimal point is needed to represent the number, 8 characters
% will be output and if a decimal point is not included in the representation
% then only 7 characters are output. This is most useful when using
% proportional width fonts. The period is not counted because the character
% width of the period is small compared with the '0-9' digits. Actually
% since most GUIs are rendered using proportially spaced fonts, the w format
% is used more often than the W format.
%
if nargin~=2 disp('Calling sequence: resultString = Pftoa(formatString,val)'); return; end;

fmtstr = deblank(fmtstr);                 % make sure format code is the last character
fcode = fmtstr(end);  fc = upper(fcode);  % extract format code. Convert to upper case
fw = fmtstr(2:end-1);                     % extract field width
pad = 0;                                  % no final padding (+1/-1 = pad on left/right)
if isempty(fw) fw = '7'; end;             % if field width is omited, use the default (7)
mf = fw(1);  sp = ' '; lmf = lower(mf);   % get possible modifier
if lmf=='k' mf=mf-1; lmf=lmf-1; sp=''; end; % k/K modifiers are more "Kompact" than j/J (no spaces)
if lmf=='j'                               % is there a complex modifier?
  fw(1) = '%';  fw = [fw fcode];          % yes, create the format string without the modifier
  ival = imag(val);  rval = real(val);
  if mf=='J' | (rval*ival)~=0
              if ival<0 pp = '-'; ival = -ival; else pp = '+'; end;
              if rval==0 rval=abs(rval); end;
              s = [Pftoa(fw,rval) sp pp sp Pftoa(fw,ival) 'i'];  % both real/imag parts
  elseif ival s = [Pftoa(fw,ival) 'i']; else s = Pftoa(fw,rval); % only need one part
  end;
  return;
end;
if fc~='W' & fc~='V'  s = sprintf(fmtstr,val); return; end; % use sprintf if format isn't v,V,w,W
uc = fc==fcode;                           % upper case code (i.e. V or W)
val = real(val);                          % ignore imaginary part
if mf=='+' pad=1; elseif mf=='-' pad=-1; end;
if pad fw = fw(2:end); if isempty(fw) fw = '7'; end; end;
w = sscanf(fw,'%d'); v = w;               % get field width
if ~w s = ''; return; end;                % zero field width returns an empty string
if fc=='V' s = [blanks(v-1) '*']; else s = '*'; end;  ss = s;  neg = [];
if     val==0     s = strrep(s,'*','0');

elseif isnan(val) s = [blanks(length(s)-3) 'NaN']; if v<3 s=s(1:v); end;
elseif isinf(val) if val>0 s = [blanks(length(s)-3) 'Inf'];  if v<3 s=s(1:v); end;
                  else     s = [blanks(length(s)-4) '-Inf']; if v<4 s=s(1:v); end;
                  end;
else neg = val<0;
end;
if isempty(neg)  % special cases (0,Inf,Nan) come here
  if pad
    if fc=='W'    p = v-length(s);  if p<1 return; end;
                  if pad>0 s = [blanks(p) s]; else s = [s blanks(p)]; end;
    elseif pad<0  while s(1)==' ' s = [s(2:end) ' ']; end;
    elseif val==0 s = ['0.' repmat('0',1,v-2)]; 
    end;
  end;
  return;
end;
q = [6 0 1 1; 5 1 1 2; 4 0 3 3; 0 0 0 0; 3 0 4 4; 4 1 2 3; 5 2 0 2;   % v,w formats
     7 1 0 0; 6 2 0 1; 5 1 2 2; 0 0 0 0; 4 1 3 3; 5 2 1 2; 6 3 -1 1]; % V,W formats
q = q(7*uc+min(find(abs(val) < [1e-99 1e-9 .01 10^(v-neg) 1e10 1e100 inf])),:);
fp = v - q(1) - neg;                         % compute fp, the format precision
if fp==-1 & uc fp=0; v=v+1; end;
if fp<0 return; end;                         % not enough digits available
if q(1) fmt = 'e'; else fmt = 'g'; end;      % select the e or g format
if ~fp  q = q + [0,1,-1,-1]; end;            % e format sometimes removes the "."
s = sprintf(sprintf('%%1.%d%c',fp,fmt),val); % convert to decimal string
n = length(s);                               % length of result
if n>3 & s(n-3)=='e'                         % is it a 2 digit exponent (for MAC)
  s = [s(1:n-2) '0' s(n-1:n)];               % change it to 3 digits
  n = n + 1;
end;
if q(1) q = [1:v-q(2) v+q(3):v+q(4)];        % here for e format
else                                         % here for g format
  fdot = findstr('.',s);
  if length(fdot)
    i = uc;  lz = 0;
    if fdot==2 & s(1)=='0' | length(findstr('-0.',s))
       i = i + 1;
       lz = length(findstr('0.0',s));
    end;
    if i s = sprintf(sprintf('%%1.%dg',fp-i),val); % use one or two fewer digits
         n = length(s);
    end;
    if lz s = strrep(s,'0.0','.0'); n=n-1; end;
  end;
  q = 1:min(~uc+v,n);
end; % end if q(1)
if max(q)>n s = ss; return; end;             % don't go over array bounds
s = s(q);  n = length(s);
if length([findstr(s,'0') findstr(s,'.') findstr(s,'-')]) == n % is there at least one nonzero digit?
  s = ss; return;                                              % return if not
end;
if fc=='V'
  p = w-length(s);                           % number of padding characters required
  isp = length(findstr('.',s));              % true if there is a period
  if ~uc p=p+isp; end;
  if p<=0 return; end;                       % no padding required
  if fmt=='e' s = [' ' s]; return; end;      % pad with blanks on left (p will be 1)
  if ~isp s=[s '.']; if uc p=p-1; end; end;  % if there is no period, add one before padding
  s = [s repmat('0',1,p)];                   % pad with zeros on the right
elseif pad & fc=='W'
  p = v-length(s);  if p<1 return; end;
  if pad>0 s = [blanks(p) s]; else s = [s blanks(p)]; end;
end;
end
% end function Pftoa