function [G] = green_multi_val(rho, h, O, P, coeff)
%green_multi Computes Green's function value for a N-layered soil.
%   Author : Amauri G. Martins-Britto (amaurigmartins@gmail.com)
%   Date   : 09 April 2020
%
%   *** Arguments
%   rho : (vector 1 x N) soil resistivities [ohm.m]
%   h   : (vector 1 x N-1) layer thicknesses [m]
%   O   : (vector 1 x 3) (x,y,z) coordinates of the source point [m]
%   P   : (vector 1 x 3) (x,y,z) coordinates of the observation point [m]
%
%   *** Outputs
%   G : (scalar) Green's function value [V]
%
%   External function called: green_multi_sym.m, to compute Green's
%   function coefficients.
%
if nargin == 4 
    coeff=[];
end

soil_model = [rho h];
n_layers=(length(soil_model)+1)/2;
n_int=n_layers-1;
rho=soil_model(1:n_layers);
h=cumsum(soil_model(n_layers+1:end));
x_src=O(1);y_src=O(2);z_src=O(3);
x_obs=P(1);y_obs=P(2);z_obs=P(3);
rr=sqrt((x_obs-x_src)^2+(y_obs-y_src)^2);
zz=z_obs-z_src;
%
src_layer=find(h>z_src);
if isempty(src_layer)
    src_layer=n_layers;
else
    src_layer=src_layer(1);
end
%
obs_layer=find(h>z_obs);
if isempty(obs_layer)
    obs_layer=n_layers;
else
    obs_layer=obs_layer(1);
end
%
syms lambda z D d
assumeAlso(D ~= 0)
assumeAlso(lambda ~= 0)
assumeAlso(d ~= 0)
%
for i=1:n_layers
    eval(['syms rho' num2str(i)]);
    eval(['assumeAlso(rho' num2str(i) ' ~= 0)']);
    if i<n_layers
        eval(['syms h' num2str(i)]);
        eval(['assumeAlso(h' num2str(i) ' ~= 0)']);
    end
end
%
if isempty(coeff) %if coefficients are provided, don't compute again
    [fun,coeff]=green_multi_sym(n_layers, src_layer);
end
%
d=z_src;
for i=1:n_layers
    eval(['rho' num2str(i) '=' num2str(rho(i),'%16.16f') ';'])
    if i<n_layers
        eval(['h' num2str(i) '=' num2str(h(i),'%16.16f') ';'])
    end
end
%
T1=eq(obs_layer,src_layer)*exp(-lambda*abs(zz));
T2=eval(['simplify(subs(coeff.A' num2str(src_layer) num2str(obs_layer) '))'])*exp(-lambda*zz);
T3=eval(['simplify(subs(coeff.B' num2str(src_layer) num2str(obs_layer) '))'])*exp(lambda*zz);
%
f=(T1+T2+T3)*besselj(0,lambda*rr);
f=matlabFunction(f);
ff=@(lambda) sum([0 f(lambda)],'omitnan');
%
G=rho(src_layer)/(4*pi).* integral(ff,0,Inf,'ArrayValued',true);
%
end

