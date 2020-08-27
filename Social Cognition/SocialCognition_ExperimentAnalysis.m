%---------------------------- social cognition experiment analysis------------
% script written by Jasmin Walter

% a short analysis of the joint action project during the social cognition
% course of summer semester 2020 at University of Osnabrück
% data was recorded via a questionnaire after collective drawing tasks

clear all;

cd 'D:\Studium\Master\social cognition\'
savepath=('D:\Studium\Master\social cognition\ExperimentAnalysis\');

% load data
nameA = 'Group A_ Joint Action Questionnaire (Responses) - Form responses 1.csv';
groupA = readtable(nameA);

nameB = 'Group B_ Joint Action Questionnaire (Responses) - Form responses 1.csv';
groupB = readtable(nameB);


%% analysis with boxplots & grouping variables
g1 = repmat({'simple task group'},14,1);
g2 = repmat({'complex task group'},15,1);
grouping = [g1; g2];

question1 = [groupA{:,2};groupB{:,2}];

figure(1)
plotty1 = boxplot(question1,grouping);
title('How successful was your team in completing the tasks?')
saveas(gcf, strcat(savepath, 'Boxplot_question1.png'));

question2 = [groupA{:,3};groupB{:,3}];

figure(2)
plotty2 = boxplot(question2,grouping);
title('How harmonious would you rate the interaction in the team?')
saveas(gcf, strcat(savepath, 'Boxplot_question2.png'));

question3 = [groupA{:,4};groupB{:,4}];

figure(3)
plotty3 = boxplot(question3,grouping);
title('How connected do you feel with your teammates?')
saveas(gcf, strcat(savepath, 'Boxplot_question3.png'));

question4 = [groupA{:,5};groupB{:,5}];

figure(4)
plotty4 = boxplot(question4,grouping);
title('Overall, how do you feel about the team interaction?')
saveas(gcf, strcat(savepath, 'Boxplot_question4.png'));


question5 = [groupA{:,6};groupB{:,6}];

figure(5)
plotty5 = boxplot(question5,grouping);
title('How close do you feel to the rest of the breakout team members?')
saveas(gcf, strcat(savepath, 'Boxplot_question5.png'));

% now combine data of all questions 
allA = groupA{:,2:6};
allArs = reshape(allA,[],1);

allB = groupB{:,2:6};
allBrs = reshape(allB,[],1);

g1 = repmat({'Simple task group'},size(allArs));
g2 = repmat({'Complex task group'},size(allBrs));
groupingAll = [g1; g2];

allData = [allArs; allBrs];

figure(6)
plotty6 = boxplot(allData,groupingAll);
title('All questions combined')
saveas(gcf, strcat(savepath, 'Boxplot_allData.png'));

%% calculate means

overviewMean = table;
overviewMean.GroupA = mean(groupA{:,2:end})';
overviewMean.GroupB = mean(groupB{:,2:end})';

overallMean = mean(overviewMean{:,:});

%% complete two sampled t tests for each question/hypothesis
[h1,p1,ci1,stats1] = ttest2(groupA{:,2},groupB{:,2},'Tail','right');
[h2,p2,ci2,stats2] = ttest2(groupA{:,3},groupB{:,3},'Tail','right');
[h3,p3,ci3,stats3] = ttest2(groupA{:,4},groupB{:,4},'Tail','right');
[h4,p4,ci4,stats4] = ttest2(groupA{:,5},groupB{:,5},'Tail','right');
[h5,p5,ci5,stats5] = ttest2(groupA{:,6},groupB{:,6},'Tail','right');

