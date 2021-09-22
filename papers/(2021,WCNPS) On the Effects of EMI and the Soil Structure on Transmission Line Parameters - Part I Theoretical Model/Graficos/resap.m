
function [resap] = resap(rho, h, a)
warning off;
nro_pontos = size(a);

k = kernel(rho,h);
resap = zeros(1,nro_pontos(2));

for i=1:nro_pontos(2)
    f_lambda=@(lambda) ((k(lambda).*exp(-2*lambda*h(1)))./(1-k(lambda).*exp(-2*lambda*h(1)))).*(besselj(0,lambda.*a(i))-besselj(0,lambda.*2.*a(i)));
    resap(i)=rho(1).*(1+4.*a(i).*integral(f_lambda,0,Inf,'ArrayValued',true)); %4/h(1) deve ser o bastante para precisão numérica.
    
    
end

end