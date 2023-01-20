% electro-magnetism algorithm
% written by Mojtaba Eslami

clear all

n = 2;
MaxIter = 25*n;
LSIter = 10;
m = 20;
delta = 0.03;
lk = 0;
uk = 4;

Length = delta*(uk-lk);

% generation of the initial random vectors
for i=1:m 
    lambda = rand(2,1);
    x(:,i) = lk+lambda*(uk-lk);
    f(i) = -sin(x(1,i))*sin(x(1,i)^2/pi)^20-sin(x(2,i))*sin(2*x(2,i)^2/pi)^20;
end

X = [0:0.01:4];
Y = [0:0.01:4];
for i=1:length(X)
    for j=1:length(Y)
        fun(i,j) = -sin(Y(j))*sin(Y(j)^2/pi)^20-sin(X(i))*sin(2*X(i)^2/pi)^20;
    end
end
figure(1);clf;hold on
contour(X,Y,fun,20)
plot(x(1,:),x(2,:),'k.')
xlabel('x_1')
ylabel('x_2')
colormap(gray)
axis([0 4 0 4])
    
f_best(1) = min(f);

iteration = 1;
while iteration<MaxIter
    f_best(iteration) = min(f);
    
    % local search procedure
    counter = 1;
    for i=1:m
        lambda1 = rand;
        while counter<LSIter
            y = x(:,i);
            lambda2 = rand(2,1);
            if lambda1>0.5
                y = y+lambda2*Length;
            else
                y = y-lambda2*Length;
            end
            
            if -sin(y(1,i))*sin(y(1,i)^2/pi)^20-sin(y(2,i))*sin(2*y(2,i)^2/pi)^20<f(i)
                x(:,i) = y;
                counter = LSIter-1;
                f(i) = -sin(x(1,i))*sin(x(1,i)^2/pi)^20-sin(x(2,i))*sin(2*x(2,i)^2/pi)^20;
            end
            counter = counter+1;
        end
    end
    index = find(f==min(f));
    x_best = x(:,index);
    
    % calculation of the total force vector
    for i=1:m
        q(i) = exp(-n*(f(i)-f(index))/sum(f-f(index)));
        F = zeros(2,m);
    end
    for i=1:m
        for j=1:m
            if f(j)<f(i)
                F(:,i) = F(:,i)+(x(:,j)-x(:,i))*q(i)*q(j)/(norm(x(:,j)-x(:,i))^2);
            elseif j~=i
                F(:,i) = F(:,i)-(x(:,j)-x(:,i))*q(i)*q(j)/(norm(x(:,j)-x(:,i))^2);
            end
        end
    end
    
    % movement according to the total force
    for i=1:m
        if i~=index
            lambda = rand;
            F(:,i) = F(:,i)/norm(F(:,i));
            for k=1:n
                if F(k,i)>0
                    x(k,i) = x(k,i)+lambda*F(k,i)*(uk-x(k,i));
                else
                    x(k,i) = x(k,i)+lambda*F(k,i)*(x(k,i)-lk);
                end
            end
        end
    end
    iteration = iteration+1;
    
    for i=1:m 
        f(i) = -sin(x(1,i))*sin(x(1,i)^2/pi)^20-sin(x(2,i))*sin(2*x(2,i)^2/pi)^20;
    end

end

x_best

figure(2);clf;hold on
contour(X,Y,fun,20)
plot(x(1,:),x(2,:),'k.')
xlabel('x_1')
ylabel('x_2')
colormap(gray)
axis([0 4 0 4])
plot(x(1,:),x(2,:),'k.')

figure(3)
plot(f_best,'k.')
xlabel('iteration number')
ylabel('min f(x_1,x_2)')

