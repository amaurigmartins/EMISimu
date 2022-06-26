function [G,V] = AnaliticalGreenFunction(f1,h,p,I,eps,O,P)
%f1 frequencia
%h coordenada Z da camada
%p resistividade das camadas
%I corrente de excitação
%O=[0 0 0.5]; %src
%P=[0 0 1]; %obs
%eps permissividade relativa das camadas
m0=4*pi*10^-7;
e0=1/299792458^2/m0;




    
sig0 = (1+sqrt(1-4*p.*(f1*2*pi).^2.*(e0*eps).^2))./(2*p);
sig=sig0 + 1i*f1*2*pi*(e0*eps);
    
    
n= size(sig,2);



x_src=O(1);
y_src=O(2);
z_src=O(3);

x_obs=P(1);
y_obs=P(2);
z_obs=P(3);

rr=sqrt((x_obs-x_src)^2+(y_obs-y_src)^2);
zz=z_obs-z_src;

src_layer=find(h>z_src);
if isempty(src_layer)
    src_layer=n;
else
    src_layer=src_layer(1);
end

obs_layer=find(h>z_obs);
if isempty(obs_layer)
    obs_layer=n;
else
    obs_layer=obs_layer(1);
end


syms z lambda
H = sym('H',[1 n-1]);
k = sym('k',[1 n-1]);

% assumeAlso(k > 0)
% assumeAlso(lambda,'real')
% assumeAlso(lambda ~= 0)
assumeAlso(H,'real')
assumeAlso(z,'real')

a= exp(-2*lambda*(H-z));

% b= exp(-lambda*(abs(H - z)+(H - z)))

A=[];
A=sym(A);
A(1,1)=1;

B=[];
B=sym(B);
if src_layer==1
    B(1)=0;
end

for i=1:n-1
    A([i*2 : i*2+1],[i*2-1 : i*2+2]) =[ a(i) 1 -a(i) -1 ; -a(i) 1 k(i)*a(i) -k(i)];
    
    if i==src_layer-1
        B([i*2 : i*2+1]) = [1 ; k(i)];
    elseif i==src_layer
        B([i*2 : i*2+1]) = [-a(i) ; a(i)];
    else
        B([i*2 : i*2+1]) = [0 ; 0];
    end
    F(i)=sig(i+1)/sig(i) ;
    
end

i=i+1;
A(i*2,i*2) =[1];
B(i*2) = [0];
B=B.';
A;
B;
A=subs(A,z,z_src);
A=subs(A,H,h);
A=subs(A,k,F);

B=subs(B,z,z_src);
B=subs(B,H,h);
B=subs(B,k,F);

S = linsolve(A,B);
% S=subs(S,z,z_src);
% S=subs(S,H,h);
% S=subs(S,k,F);
S=simplify(S);


for i=1:n
    A1(i) = S(i*2-1);
    B1(i) = S(i*2);
end
% simplify(Res)
% C = [A1 B1]'
C = S;
% isequal(simplify(Res),simplify(C(1:end-1)))


T1=eq(obs_layer,src_layer)*exp(-lambda*abs(zz));
T2=A1(obs_layer)*exp(-lambda*zz);
T3=B1(obs_layer)*exp(lambda*zz);


f=(T1+T2+T3)*besselj(0,lambda*rr);


f=simplify(f);

f=matlabFunction(f);
ff=@(lambda) sum([0 f(lambda)],'omitnan');
% f1
% faa 
% isequal(f,faa)
G=1/(sig(src_layer)*4*pi)* integral(ff,0,Inf,'ArrayValued',true);
V=G*I;
%abs(V)
%angle(V)/pi*180;


