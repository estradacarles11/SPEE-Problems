clear all;
close all;
clc;

%Define model

model=arima('Constant', 1,'MA',{0.8,0.7},'MALags',[1,2],'Variance',2);
rng('default');
Y=simulate(model,80,'NumPaths',500);
figure(1);
plot(Y,'Color',[0.85,0.85,0.85]);
hold on;
h=plot(mean(Y,2),'k','LineWidth',2);
legend(h,'Simulation Mean', 'Location', 'NorthWest');
title('MA Process Mean');



figure(2);
plot(var(Y,0,2),'Color',[.75,.75,.75],'LineWidth',1.5)
xlim([0,80])
title('Unconditional Variance')
hold on
plot(1:80,4.26*ones(80,1),'k--','LineWidth',2)
legend('Simulation','Theoretical','Location','SouthEast');
hold off
title('MA Process Variance');

figure()
max_lag=100;
autocorr_x= crosscorr_estimator (Y,Y,max_lag);
stem ([0:max_lag],autocorr_x);
title('Autocorrelation');

function xcorr=crosscorr_estimator(x,y,Max_lag)
Nsamples=length(x);
for lag=0:Max_lag
    xcorr(lag+1)=sum(x(lag+1:Nsamples).*y(1:Nsamples-lag))/(Nsamples-lag);
end
end



