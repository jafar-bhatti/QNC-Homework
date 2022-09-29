%data
wing_length = [10.4, 10.8, 11.1, 10.2, 10.3, ... 
                10.2, 10.7, 10.5, 10.8, 11.2, 10.6, 11.4];
            
tail_length = [7.4, 7.6, 7.9, 7.2, 7.4, 7.1, 7.4, 7.2, ...
               7.8, 7.7, 7.8, 8.3];
           
%plot
figure
scatter(wing_length, tail_length)
xlabel("Wing Length");
ylabel("Tail Length");

%Calculating the pearson coefficient manually
x_mu = mean(wing_length);
y_mu = mean(tail_length);

num = sum( (wing_length - x_mu) .* (tail_length - y_mu) );
denom = sqrt(sum((wing_length - x_mu).^2)) .* sqrt(sum((tail_length - y_mu).^2));
r_xy = num/denom;
fprintf('%s %.04f', "Manually calculated r: ", r_xy);

%Now calculate it using a matlab function
r_xy_function = corrcoef(wing_length', tail_length');
fprintf('\n %s %.04f', "Matlab calculated r: ", r_xy_function(2,1));

%standard error calculation
s_r = sqrt( (1-r_xy)/(length(wing_length)-2) );
fprintf('\n %s %0.4f', "Standard error of pearson's correlation = ", s_r);

%Confidence intervals 
z = 0.5 * ln((1+r_xy)/(1-r_xy)); %Fishers z transformation of r
s_z = sqrt(1/(length(wing_length)-3)); %Compute sd
z_criterion = norminv(.95); %turn 0.05 criterion into z score
upper_bound = z + (z_criterion * s_z);
lower_bound = z - (z_criterion * s_z);
%convert back to r scores.






