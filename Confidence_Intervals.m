mu = 10; %Mean of the Gaussian distributed population 
sd = 2; %Standard deviation of the Gaussian distrubuted population
n = [5, 10, 20, 40, 80, 160, 1000]; %Sample sizes. I'll just do one at a time.
c_i = .95; %Confidence interval

%% Method 1: Using the standard error of the mean (with known sd)
sem = sd./(sqrt(n)); %Calculate the SEMs for each sample size
z_score = 0.5*(1-c_i); %Find the z-score for a 95% interval
interval = sem * z_score; % Calculate the interval

% Sample a Gaussian distributed population and collect sample means
sample_means = zeros(length(n), 1);
for i = 1:length(n)
sample_means(i,1) = mean(mu + sd.*randn(n(i),1));
end

%Calculate the upper and lower bounds of the interval
low = sample_means - interval';
high = sample_means + interval';

%Put all the data together
data_1 = cat(2, n', sample_means, interval', low, high);
%% Method 2 (using students t-distribution)
t = [2.77645, 2.26216, 2.09302];

n_short = n(1, 1:3);

% Sample a Gaussian distributed population and collect sample means and
% sample standard deviations
sample_means = zeros(length(n_short), 1);
sample_s = zeros(length(n_short), 1);
for i = 1:length(n_short)
temp = mu + sd.*randn(n_short(i),1);
sample_means(i,1) = mean(temp);
sample_s(i, 1) = std(temp);
end

interval = t'.*(sample_s./sqrt(n_short'));
low = sample_means - interval;
high = sample_means + interval;

data_2 = cat(2, n_short', sample_means, low, high); 