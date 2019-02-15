clear all;
clc;
format long;
n = 1000000;
%%Forecasting S1 for 11th of January (n = 66)
S_1 = zeros(1,n);
S_5 = zeros(1,n);
for k = 1:n
    Z = normrnd(0, 1, [1,10]);
    S = zeros(0,10);
    mu = 0;
    std = 0.005871127;
    S_0 = 1630.29;
    for i = 1:10
        S(i) = S_0 *(exp(i*mu + sqrt(i)*std*Z(i)) - 1);
    end
    S_1(k) = S(1);
    S_5(k) = S(5);
end
fprintf('0.05 quantile for S1 [11th of Jan 2018] is %f \n', quantile(S_1, 0.05))
fprintf('0.05 quantile for S5 [11th of Jan 2018] is %f \n', quantile(S_5, 0.05))

%%Forecasting S1 for 9th of February (n = 59)
S_1 = zeros(1,n);
S_5 = zeros(1,n);
for k = 1:n
    Z = normrnd(0, 1, [1,10]);
    S = zeros(0,10);
    mu = 0;
    std = 0.009056271;
    S_0 = 1500.18;
    for i = 1:10
        S(i) = S_0 *(exp(i*mu + sqrt(i)*std*Z(i)) - 1);
    end
    S_1(k) = S(1);
    S_5(k) = S(5);
end
fprintf('0.05 quantile for S1 [9th of Feb 2018] is %f \n', quantile(S_1, 0.05))
fprintf('0.05 quantile for S5 [9th of Feb 2018] is %f \n', quantile(S_5, 0.05))