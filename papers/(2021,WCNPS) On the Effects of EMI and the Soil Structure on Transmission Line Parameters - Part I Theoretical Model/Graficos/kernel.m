
function [ KK ] = kernel( rho, h )

Nmax=length(rho);
k = zeros(1, Nmax-1);

for n=Nmax-1:-1:1
    
    k = (rho(n+1)-rho(n)) / (rho(n+1)+rho(n));
    
    if n==Nmax-1
        k_nn =  {num2str(k)};
    else
        k_nn= {strcat('((',num2str(k),')+(',char(k_nn),')*exp(-2*(',num2str(h(n+1)),')*lambda)) / (1+(',num2str(k),')*(',char(k_nn),')*exp(-2*(',num2str(h(n+1)),')*lambda))')};
    end
    
end
KK= eval(char(strcat('@(lambda)',k_nn)));

end