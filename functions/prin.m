function s = prin(app,fmt,varargin)
%
% prin.m:  An alternative to sprintf() & fprintf() - version 16Feb17
%          Calls Pftoa.m
%
% Calling sequence: ------------------------------
% s = prin(app,FormatString,OptionalArguments)
%               or
% s = prin(app,FileID,FormatString,OptionalArguments)
%
% FormatString '%nV' uses exactly n characters
% FormatString '%nW' uses at most n characters
% Formats v,w are similar except that decimal points are not counted
%
% For a more complete description, type "prin" at the command prompt.
%     (This will open prin.pdf)
%
% Author:  Paul Mennen (paul@mennen.org)
%          Copyright (c) 2017, Paul Mennen

s = '';
if ~nargin % open the documentation file if called without arguments
  if exist('s') open(feval('which','prin.pdf')); return; end;
end;
if iscell(fmt) & nargin==1                                  % special form used to set pretty print defaults
  if length(fmt) setappdata(0,'prin',fmt);                  % set new defaults
  else           rmappdata(0,'prin');                       % revert to defaults
  end;
  return;
end;
if isnumeric(fmt)                                           % here if the first argument is numeric?
  if nargin==1                                              % single numeric argument special case (array pretty print)
    f = '%+7W  ';  hdr = '%3d: ';  epr = 10;                % default format, header format, and number of entries per row
    v = getappdata(0,'prin');  lv = length(v);              % get f,epr,hdr from prin appdata if it exists
    if lv  f=v{1};  if lv>1 epr=v{2}; end;  if lv>2 hdr=v{3}; end;
           if isnumeric(f) f = sprintf('%%+%dW  ',f); end;
    end;
    f = sprintf('%s%d{%s}\\n',hdr,epr,f);                    % build prin format string
    v = fmt(:);  n = length(v);  pad = ceil(n/epr)*epr - n;  % number of pad elements to make a multiple of 10
    c = (n+pad)/epr;  head = epr*(1:c) - epr + 1;            % number of columns to print, header row
    v = [head; reshape([v; zeros(pad,1)],epr,c)];  v = v(:); % reshape input
    s = prin(app,f,v(1:end-pad));
    return;
  end;
  s = prin(app,varargin{:});                                    % come here if the 1st arguement a FileID or a file name
  if length(fmt)>1                                          % is the first argument a file name?
       if fmt(1)>0 p = 'at'; else p = 'wt'; fmt=-fmt; end;  % yes, come here (+/- = append/write)
       fmt = char(fmt);  nc = fmt(1)==' ';  if nc fmt(1)=''; end; % don't close if space in filename
       fmt = fopen(fmt,p); fwrite(fmt,s);
       if nc setappdata(0,'FIDp',fmt); else fclose(fmt); end;
  else v = version;                                           % no, come here if it's a FileID
       if v(1)=='6' & (fmt==1 | fmt==2)                       % fwrite to standard out doesn't 
            fprintf(fmt,strrep(strrep(s,'%','%%'),'\','\\')); % work in ver 6.1
       elseif fmt<1 f = getappdata(0,'FIDp');  fwrite(f,s);  if fmt<0 fclose(f); end;
       else fwrite(fmt,s);
       end;
  end;
  return;
end;
fmt = strrep(strrep(fmt,'\{','\173'),'\}','\175'); % replace \{ and \} with octal codes
p = find(fmt=='{');                     % search for last repeat block
while length(p)                         % keep going until all {} repeat blocks are expanded
  p = p(end);  v = p;                   % p points to left bracket, v points to repeat count
  q = find(fmt(p:end)=='}');
  if isempty(q) disp('unmatched { in format string'); return; end;
  q = q(1)+p;                           % point to character after matching end brace
  bb = fmt(p+1:q-2);                    % contents between the braces
  r = fmt(max(1,p-1))-48;               % get single digit repeat count
  if r>=0 & r<=9                        % valid repeat count.
       v = v-1;
       if p>2 r2 = fmt(p-2)-48;                                 % is this a 2 digit repeat count?
              if r2>=0 & r2<=9  v=v-1; r=r+10*r2; end;          % if yes, compute new repeat count
       end;
       bb = repmat(bb,1,r);                                     % replicate the repeat block
       e = find(bb=='!');                                       % find all the explanation points
       if length(e) bb([e e(end)+1:end]) = []; end;             % remove all ! & text after the last !
       fmt = [fmt(1:v-1) bb fmt(q:end)];                        % insert the replicated text
  else if length(find(bb=='%'))~=1 | r==46 | r==47              % no valid repeat count
            fmt = [fmt(1:p-1) '\173' bb '\175' fmt(q:end)];     % assume normal text (super/subscripts)
       else fmt = [fmt(1:p-1) 'LbRaCe' bb 'RbRaCe' fmt(q:end)]; % assume vector format (exactly one %)
       end;
  end;
  p = find(fmt=='{');                   % cycle thru all repeat blocks (back to front order)
end;  % end while length(p)
fmt = strrep(strrep(fmt,'LbRaCe','{'),'RbRaCe','}'); % change back to braces around the delimiters
p = find(fmt=='%');     % search for '%' format codes
q = find(diff(p)==1);   % search for '%%'
while length(q) p(q(1):q(1)+1) = []; q = find(diff(p)==1); end; % remove all '%%' from the list
n = length(p);          % number of format codes
nn = length(fmt);       % length of fmt argument
codes = 'vVwWscdiouxXfeEgG';
c = cell(1,n+1);        % will contain all the characters of fmt with format strings removed
f = cell(1,n);          % will contain all the format strings contain in fmt
ws = zeros(1,n);        % used to save the code index associated with f{n}
g=f; d=f; e=ws;         % f,d has format text surrounding bracketed format string f{k}. e has position of '!'
cb = 1;                 % point to beginning of next c{} string
for k=1:n               % extract the n format strings into f{1} to f{n}
  q = p(k);  w = '';    % q is the location of the % sign for this format string
  c{k} = fmt(cb:q-1);   % save format text between f{k-1} and f{k} (not including format strings)
  lb = find(c{k}=='{'); % pointer to left bracket
  if length(lb)
    lb = lb(1);
    g{k} = sprintf(c{k}(lb+1:end));  % remove first part of bracketed format from c and put it in g
    c{k} = c{k}(1:lb-1);
  end;
  for j=q+1:nn         % search for the format code (i.e. the end of the format string)
    w = find(codes==fmt(j));
    if length(w) break; end;
  end;
  if isempty(w) disp(sprintf('sprint: Unknown format code starting with %s',fmt(q:end))); return; end;
  ws(k) = w;               % save format code index
  f{k} = ['%' fmt(q+1:j)]; % save format string from the '%' to the format code
  cb = j+1;
  if length(lb)
    w = find(fmt(cb:end)=='}');
    if isempty(w) disp('unmatched { in format string'); return; end;
    w = w(1) + cb;                  % point to character after the matching right brace
    d{k} = sprintf(fmt(cb:w-2));    % the remaining portion of the bracket vecotr format
    ek = find(d{k}=='!');           % search for delimiter character
    if length(ek) d{k} = strrep(strrep(d{k},'!row','! ~, '),'!col','! ~; ');
                  ek=ek(1); e(k)=ek; d{k}(ek)=[];    % if found, record its position and remove it
    else          e(k) = length(d{k})+1;             % nonzero indicates a bracket vector format
    end;
    cb = w;
  end;
end;  % end for k=1:n
if cb<=nn c{n+1} = sprintf(fmt(cb:nn)); end;         % save format text that follows the last format string
for k=1:n c{k} = sprintf(c{k}); end;                 % sprintf conversions (e.g. \t to tab character)
s = c{1};  q = 1;                                    % q points to the next format string
na = length(varargin);  k = 0;                       % k points to the argument being processed
if na & ~n disp('prin(app,) warning: No format codes. Variables not converted.'); na=0; end;
while k < na                                         % cycle thru all the arguments
  k = k+1;  arg = varargin{k};                       % get next argument
  while iscell(arg)
    varargin = [arg(:)' varargin(k+1:end)];          % if it's a cell array, append it to the
    k=1;  arg = varargin{1};  na = length(varargin); % front of the remaining arguments
  end;
  if e(q)>0
    arg = arg(:);  nb = length(arg);                 % bracket vector format comes here
    for j=1:nb                                       % loop thru each number in the vector
      ft = Pftoa(app,f{q},arg(j));                       % convert the next number in the vector to ascii
      if j<nb s = [s g{q} ft d{q}];                  % surround the number with left and right text (g,d)
      else    s = [s g{q} ft d{q}(1:e(q)-1) c{q+1}]; % for last vector element, don't include the delimiter
      end;
    end;
    q = q + 1;                                       % advance to next format string
    if q>n & k<na q=1; s=[s c{1}]; end;              % reuse the format string from the beginning
  else                                               % here for not a bracket vector format
    if ws(q)==5 s = [s sprintf(f{q},arg) c{q+1}];    % here for %s format
                q = q + 1;                           % advance to next format string
                if q>n & k<na q=1; s=[s c{1}]; end;  % reuse the format string
    else                                             % here for all other formats (except %s)
      arg = arg(:);  nb = length(arg);
      for j=1:nb                                     % cycle thru each element of next argument
        s = [s Pftoa(app,f{q},arg(j)) c{q+1}];           % conversion with Pftoa
        q = q + 1;                                   % advance to next format string
        if q>n & (j<nb | k<na) q=1; s=[s c{1}]; end; % reuse the format string from the beginning
      end;    % end for j=1:nb
    end;      % end if ws(q)==5
  end;        % end if e(k)>=0
end;          % end while k <= na
pr = findstr(s,' ~, '); pc = findstr(s,' ~; ');      % find the cell array row & column separators
n = length(pr) + length(pc);
if ~n return; end;                                   % return if cell seperators were not used
pp = sort([pr pc+.1 length(s)+1]);  p = round(pp);   % fractional part indicates column marker
row = 1;  col = 1;  c = s;  s = [];  p2 = -3;
for k = 1:n+1                                        % break the output string into a cell array
  p1 = p2;  p2 = p(k);                               % p1/p2 are previous and current separator locations
  s{row,col} = c(p1+4:p2-1);                         % exclude the separator characters
  if p2==pp(k) col=col+1; else col=1; row=row+1; end; % advance column or row as appropriate
end;
end
% end function prin
