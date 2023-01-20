% Simulated Annealing, written by Mojtaba Eslami


clear all

ul = 0; % lower bound of design variables
uh = 4; % higher bound of design variables

x = [ul:0.01:uh];
y = [ul:0.01:uh];
for i=1:length(x)
    for j=1:length(y)
        f(i,j) = -sin(y(j))*sin(y(j)^2/pi)^20-sin(x(i))*sin(2*x(i)^2/pi)^20;
    end
end

figure(1);clf;hold on
contour(x,y,f,20)
xlabel('x_1')
ylabel('x_2')

axis([ul uh ul uh])
colormap(gray)

c = .5; % temperature reduction factor
n = 50; % number of iterations before temperature reduction (n is used instead of the parameter m)

% estimating the value of T
x1 = ul+rand(10,1)*uh; % ten random numbers are generated for x1
x2 = ul+rand(10,1)*uh; % ten random numbers are generated for x2

f = -sin(x1).*sin(x1.^2/pi).^20-sin(x2).*sin(2*x2.^2/pi).^20;
T = abs(mean(f));

p = 1; %cycle number
i = 1; %iteration number
vicinity_radius = 2;


X = ul+(uh-ul)*rand(2,1);
X_best = X;
fbest(1) = 1000;

while p<200
    f = -sin(X(1)).*sin(X(1).^2/pi).^20-sin(X(2)).*sin(2*X(2).^2/pi).^20;
    
    X_new(1) = max(X(1)-vicinity_radius,ul)+rand*(min(X(1)+vicinity_radius,uh)-max(X(1)-vicinity_radius,ul));
    X_new(2) = max(X(2)-vicinity_radius,ul)+rand*(min(X(2)+vicinity_radius,uh)-max(X(2)-vicinity_radius,ul));
       
    f_new = -sin(X_new(1)).*sin(X_new(1).^2/pi).^20-sin(X_new(2)).*sin(2*X_new(2).^2/pi).^20;
    
    % accept or reject X_new using Metropolis criterion
    if f_new<f
        X = X_new;
        
        %saving the results
        if f_new<min(fbest)
            X_best = X;
            fbest(p) = min(min(fbest),f_new);
        end
        
    elseif exp(-(f_new-f)/T)<rand
        X = X_new;
    end
    
        
    i = i+1;
    
    if i>=n
        fbest(p) = min(fbest);
        p = p+1;
        i = 1;
        T = c*T;
    end
end

X_best

figure(1)
plot(X_best(1),X_best(2),'k.')

figure(2)
plot(fbest,'k.')
xlabel('cycle number')
ylabel('min f(x_1,x_2)')

