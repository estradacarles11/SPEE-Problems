function rxx=biased_autocorr_estimate (Signal,Max_lag)
N=length(Signal);
for m=0:Max_lag
    rxx(m+1,1)=sum(Signal(m+1:N).*Signal(1:N-m))/N;
end
end
    
    