%%
clc;
clear All;
%% Open file and separate data
CSVFile = readmatrix("ironman death.csv");
YSearchIntrest = CSVFile(:,3);
XYear = CSVFile(:,1);
%% create new array for year and sum up year search intrest value 

YearCheck = XYear(1);
YearNumber = ceil(length(CSVFile)/12);
XNewYearSet = zeros(YearNumber,1);
YYearTotalSearchIntrest = zeros(YearNumber,1);
j=1;

for i= 1:length(CSVFile)
       if YearCheck==XYear(i)
          YYearTotalSearchIntrest(j)= YSearchIntrest(i)+ YYearTotalSearchIntrest(j);
          XNewYearSet(j)=XYear(i);
       else
           YearCheck = XYear(i);
           j=j+1;
           YYearTotalSearchIntrest(j)= ysearchIntrest(i);
           XNewYearSet(j)=XYear(i);
       end
end

%% Plot graph of Condesed data

YSearchIntrest = CSVFile(:,3);
plot(XNewYearSet,YYearTotalSearchIntrest);

%% Highlight spike values

hold on;

YSpikeMark=NaN(YearNumber,1);
for k=1:1:length(YYearTotalSearchIntrest)-2
    if(YYearTotalSearchIntrest(k+1) > YYearTotalSearchIntrest(k) && YYearTotalSearchIntrest(k+1) > YYearTotalSearchIntrest(k+2))
        YSpikeMark(k+1)=ySI(k+1);
    end
end

plot(XNewYearSet,YSpikeMark,'-*');

hold off;

%% highlight highest value

hold on;

YHightestMark=NaN(YearNumber,1);
Highest = 0;

for k=1:1:length(YYearTotalSearchIntrest)
    if(ySI(k) > Highest)
        YHightestMark=NaN(YearNumber,1);
        YHightestMark(k)=YYearTotalSearchIntrest(k);
        Highest = YYearTotalSearchIntrest(k);
    end
end

plot(XNewYearSet,YHightestMark,'-or');
title("Line Graph of Total Number of Searches for Ironman's of Each Year");
xlabel('Years');
ylabel('Number of Searches');
legend({'Search Value','Spikes In Search','Highest Search Value'},'Location','northwest');

hold off;
