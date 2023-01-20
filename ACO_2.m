 % written by Mojtaba Eslami

clear all


x = [-5:0.1:5];
y = [-5:0.1:5];
for i=1:length(x)
    for j=1:length(y)
        f(i,j) = 20+x(i)^2+y(j)^2-10*(cos(2*pi*x(i))+cos(2*pi*y(j)));
    end
end

figure(1);clf;hold on
contour(x,y,f,20)
xlabel('x_1')
ylabel('x_2')

axis([-5 5 -5 5])
colormap(gray)


figure(3);clf;hold on
contour(x,y,f,20)
xlabel('x_1')
ylabel('x_2')

axis([-5 5 -5 5])
colormap(gray)



n = 2;% the number of design variables
N = 50; % the number of ants in the colony (N is used instead of m)
p = 1000; % the number of discerete values for x1 and x2
rho = .5;
zeta = 1e3;

X1 = linspace(-5,5,p);
X2 = linspace(-5,5,p);

tau = ones(2,length(X1));

all_iter_best_f(1) = 1000;

for k=1:300
        P = [tau(1,1:end)/sum(tau(1,1:end));tau(2,1:end)/sum(tau(2,1:end))]; % the matrix of probabilities
        % roulette-wheel
        cum_prob = [cumsum(P(1,1:end));cumsum(P(2,1:end))]; %cumulative probability
        cum_prob(:,1) = [0;0]; 
        for j=1:N
            index = find(cum_prob(1,1:end)<=rand,1,'last');
            x1(1,j) = X1(index);
            index = find(cum_prob(2,1:end)<=rand,1,'last');
            x2(1,j) = X2(index);
        end
        
        if k==1
            px = x1; py=x2;
        end
            
        f = 20+x1.^2+x2.^2-10*(cos(2*pi*x1)+cos(2*pi*x2));
        fbest = min(f);
        fworst = max(f);
        tau_old = (1-rho)*tau;
        delta_tau = zeta*fbest/(fworst);
        
        % used just for plotting
        if fbest<min(all_iter_best_f)
            all_iter_best_f(k) = fbest;
        else
            all_iter_best_f(k) = min(all_iter_best_f);
        end
            
        
        index = find(f==fbest);
        
        for j=1:length(index) % in general multiple ants use the best path
            ii = find(X1==x1(index(j)));
            jj = find(X2==x2(index(j)));
            tau(1,ii) = tau_old(1,ii)+delta_tau;
            tau(2,jj) = tau_old(2,jj)+delta_tau;
        end
        
        

end

x1_best = X1(ii)
x2_best = X2(jj)

figure(1)
plot(x1,x2,'k.')

figure(2)
plot(all_iter_best_f,'k.')
xlabel('iteration number')
ylabel('min f(x_1,x_2)')

figure(3)
plot(px,py,'k.')

