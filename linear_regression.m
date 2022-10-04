age = [3,4,5,6,7,8,9,11,12,14,15,16,17];
wing_length = [1.4, 1.5, 2.2, 2.4, 3.1, 3.2, 3.2, 3.9, 4.1, 4.7, 4.5, 5.2, 5.0];

%1. Plot the relationship
scatter(age, wing_length)
hold on

%2. Calculate and plot the regression line
y = wing_length;
x = age;
b = x'\y'; %this is the slope
reg_line = b*x;
plot(age, reg_line);
xlabel("age");
ylabel("wing length");

%3. yes you can reject H_o

%4. Confidence intervals of the slope
%To calculate the confidence intervals of the slope, we must find the mean
%squared error and divide it by the least square for each value. Then we
%take the sqaure root of the whole term and multiply it by our t value
%according the t distribution. 

%5. Coefficient of determination (we can do this using a nice matlab
%function)
mdl = fitlm(age, wing_length);
mdl.Rsquared.Ordinary;

%6. Pearson's R
r = corrcoef(age, wing_length);
%The correlation assuming independence is strong



