function [fun,coeff] = green_multi_sym(n_layers, src_layer)
%green_multi_sym Computes Green's function symbolic coefficients for a N-layered soil.
%   Author : Amauri G. Martins-Britto (amaurigmartins@gmail.com)
%   Date   : 09 April 2020
%
%   *** Arguments
%   n_layers  : Number of soil layers
%   src_layer : Layer where the source point is located
%
%   *** Outputs
%   fun   : (struct) Green's function symbolic expressions
%   coeff : (struct) Green's function symbolic coefficients
%
n_int=n_layers-1;
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
solv_param=[];
for j=1:n_layers
    eval(['syms A' num2str(src_layer) num2str(j)]);
    eval(['assumeAlso(A' num2str(src_layer) num2str(j) ' ~= 0)']);
    eval(['syms B' num2str(src_layer) num2str(j)]);
    solv_param=[solv_param str2sym(['A' num2str(src_layer) num2str(j)]) str2sym(['B' num2str(src_layer) num2str(j)])];
    if j<n_layers
        eval(['assumeAlso(B' num2str(src_layer) num2str(j) ' ~= 0)']);
    else
        eval(['B' num2str(src_layer) num2str(j) '=0;']);
    end
    eval(['syms G' num2str(src_layer) num2str(j)]);
    eval(['G' num2str(src_layer) num2str(j) '= ((rho' num2str(src_layer) '*D)/(2*pi*lambda))*(eq(j,src_layer)*exp(-lambda*abs(z))+A' ...
        num2str(src_layer) num2str(j) '*exp(-lambda*z)+B' num2str(src_layer) num2str(j) ...
        '*exp(+lambda*z));'])
    eval(['fun.G' num2str(src_layer) num2str(j) '= G' num2str(src_layer) num2str(j) ';'])
end
%
eqn_count=1;
syseq(eqn_count,1)=subs(diff(eval(['G' num2str(src_layer) num2str(1)]),z),z,-d)==0;
eqn_count=eqn_count+1;
%
for i=1:n_int
    syseq(eqn_count,1)=subs(eval(['G' num2str(src_layer) num2str(i)]),z,eval(['h' num2str(i) '-d']))== ...
        subs(eval(['G' num2str(src_layer) num2str(i+1)]),z,eval(['h' num2str(i) '-d']));
    eqn_count=eqn_count+1;
    syseq(eqn_count,1)=(1/eval(['rho' num2str(i)]))*subs(diff(eval(['G' num2str(src_layer) num2str(i)]),z),z,eval(['h' num2str(i) '-d']))==...
        (1/eval(['rho' num2str(i+1)]))*subs(diff(eval(['G' num2str(src_layer) num2str(i+1)]),z),z,eval(['h' num2str(i) '-d']));
    eqn_count=eqn_count+1;
end
%
coeff=solve(syseq, solv_param);
eval(['coeff.B' num2str(src_layer) num2str(n_layers) '=0;']);
%
end

