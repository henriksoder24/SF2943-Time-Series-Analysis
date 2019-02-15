clear all;
clc;
format long;
%%11th of Januray
n = 1000000;
S_1 = zeros(1, n);
S_5 = zeros(1, n);
for k = 1:n
      
    alpha_0 = 2.490608e-06;
    alpha_1 = 0.1425148;
    beta_1 = 0.8354611;
    mu = 4.503169e-04;
    std_0 = 0.002667409;

%     alpha_0 = 1.4971e-05;
%     alpha_1 = 0.2750;
%     beta_1 = 0.2733;
%     mu = -8.6383e-05;
%     std_0 = 0.0059;
    Z = normrnd(0, 1, [1,10 + 1]);
    std = zeros(1, 10+1);
    std(1) = std_0;
    X = zeros(1, 10 + 1);
    Y = zeros(1, 10);
    S = zeros(1, 10 + 1);
    S(1) = 1630.29;
    X(1) = Z(1)*std(1);
    for i = 1:10
       std(i + 1) = sqrt(alpha_0 + alpha_1 * X(i)^2 + beta_1 * std(i)^2);
       X(i + 1) = std(i + 1) * Z(i + 1);
       Y(i) = mu + X(i + 1);
       S(i + 1) = S(1) * (exp(sum(Y))-1);
    end
    S_1(k) = S(1 + 1);
%     S_5(k) = S(1 + 5);
end
fprintf('0.05 quantile for S1 [11th of Jan 2018] is %f \n', quantile(S_1, 0.05))
% fprintf('0.05 quantile for S5 [11th of Jan 2018] is %f \n', quantile(S_5, 0.05))

%%9th of February
% S_1 = zeros(1, n);
% S_2 = zeros(1, n);
% for k = 1:n
%     
%     alpha_0 = 3.198393e-06;
%     alpha_1 = 0.17184;
%     beta_1 = 0.8067829;
%     mu = 3.518576e-04;
%     std_0 = 0.003161265;
% 
% %     alpha_0 = 0.000017006;
% %     alpha_1 = 0.879180098;
% %     beta_1 = 0.069128298;
% %     mu = -0.001570547;
% %     std_0 = 0.009056271;
% 
%     Z = normrnd(0, 1, [1,10 + 1]);
%     std = zeros(1, 10+1);
%     std(1) = std_0;
%     X = zeros(1, 10 + 1);
%     Y = zeros(1, 10);
%     S = zeros(1, 10 + 1);
%     S(1) = 1500.18;
%     X(1) = Z(1)*std(1);
%     for i = 1:10
%        std(i + 1) = sqrt(alpha_0 + alpha_1 * X(i)^2 + beta_1 * std(i)^2);
%        X(i + 1) = std(i + 1) * Z(i + 1);
%        Y(i) = mu + X(i + 1);
%        S(i + 1) = S(1) * (exp(sum(Y))-1);
%     end
%     S_1(k) = S(1 + 5);
%     S_5(k) = S(1 + 5);
% end
% fprintf('0.05 quantile for S1 [9th of Feb 2018] is %f \n', quantile(S_1, 0.05))
% fprintf('0.05 quantile for S5 [9th of Feb 2018] is %f \n', quantile(S_5, 0.05))
