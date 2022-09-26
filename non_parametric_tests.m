% Simple Non-Parametric Tests
%
%
% Copyright 2021 by Joshua I. Gold, University of Pennsylvania

%% Sign test
% 
% In this test, a postive p value means that the treatment resulted in a
% bigger value, whereas a negative p value means that the treatment results
% in a smaller value (regardless of value). The data is treated as a
% binomial distribution where the probability of an outcome is 0.5 (p =
% 0.5).
%
% Make some paired data
a = [3,10,4,20,4,7,50,3,5,5,7];
b = [5,9,10,15,6,5,43,6,2,1,0];
fprintf('p = %.2f\n', signtest(b-a))

%% Wilcocon signed-rank test
%
% This test is a substitute for a one sample t-test. Here, you are testing
% whether your distribution is different from a fixed value or not.
%
samples = randi(50, 200, 1);
null_hypothesis_median = 24;
fprintf('p = %.2f\n', signrank(samples, null_hypothesis_median))

%% Mann-Whitney test
% 
%This is similar to above except it is the substitute for a two unpaired
%sample ttest. 
%
X = randi(50, 200, 1);
Y = 2 + randi(50, 200, 1);
fprintf('p = %.2f\n', ranksum(X, Y))


%% Exercises
% 1. 
% You are a behavioral geologist measuring the reaction time of rocks in
% response to a tone. Specifically, you want to compare the median reaction
% time of geodes, to that of limestone. You recruit 20 rocks per group, and
% run your reaction-time experiment. What test would you use to compare
% median reaction times between geodes and limestone, and why?
% 
% I would use a Mann_Whitney test. Since no one has ever measured the
% reaction time of rocks, the distribution is completely unknown. To
% compare the differences between two independent samples, I would use Mann
% Whitney. 
% 
% 2.
% You are a brilliant scientist working at a biotech firm developing a
% vaccine that reverses aging. Wow! To test the efficacy of the vaccine,
% you recruit 50 people, give them a course of your vaccine, and measure
% their age with a (very) special scale before and after treatment. You
% want to start by refuting the simple that that the participants' measured
% ages are not changed by the treatment. What test do you use and why?
%
% I would use a Wilcoxin signed ranked test. Since the data for this
% experiment is coming from a single sample and we are testing whether the
% participants age changed from their baselines, this is the best test to
% use.
% 
% 3.
% You are a neuroeconomist and believe you have developed a wearable device
% that can change consumer preferences about a given product. To test your
% device, you present product X to a group of 40 individuals, and ask them
% to fill out a survery assessing how much they like the product (larger
% score means they like it more). Then, you have the individuals wear the
% device, present product X, and assess how much they like of the product.
% You want to know if the device reliably increases, decreases, or does not
% affect their liking of product X. What test would you use and why? What
% result would indicate that their liking has increased?
% 
% I would use the sign test in this case. The reason why is because we are
% trying to see if some treatment affected our measurement and in which
% direction. The results of this test will tell us whether the
% participant's attitude towards a product increased, decreased, or did not
% change. 


