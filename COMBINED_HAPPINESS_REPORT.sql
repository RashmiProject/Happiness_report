# show table for all the 3 year 
SELECT 
    *
FROM
    report_2022;
SELECT 
    *
FROM
    report_2021;
SELECT 
    *
FROM
    report_2020;

# Table shows countries in the top 20 list for the last 3 year. 
SELECT 
    report_2022.ranks AS 2022_ranks,
    report_2022.country,
    report_2021.ranks AS 2021_ranks,
    report_2021.country,
    report_2020.ranks AS 2020_reports,
    report_2020.country
FROM
    report_2022
        INNER JOIN
    report_2021 ON report_2022.ranks = report_2021.ranks
        INNER JOIN
    report_2020 ON report_2022.ranks = report_2020.ranks
LIMIT 20;

# Table shows country which are in the bottom list for the last 3 year. 
SELECT 
    report_2022.ranks AS 2022_ranks,
    report_2022.country,
    report_2021.ranks AS 2021_ranks,
    report_2021.country,
    report_2020.ranks AS 2020_reports,
    report_2020.country
FROM
    report_2022
        INNER JOIN
    report_2021 ON report_2022.ranks = report_2021.ranks
        INNER JOIN
    report_2020 ON report_2022.ranks = report_2020.ranks
ORDER BY report_2022.ranks DESC
LIMIT 20;

# Table shows countries which are above avergae GDP for 2022 
SELECT 
    ranks, country, explained_by_GDP_per_capita, happiness_score
FROM
    report_2022
WHERE
    explained_by_GDP_per_capita > (SELECT 
            AVG(explained_by_gdp_per_capita)
        FROM
            report_2022)
ORDER BY explained_by_GDP_per_capita DESC;

# Table shows countries which are above avergae GDP for 2021
SELECT 
    ranks,
    country,
    Explained_by_Log_GDP_per_capita,
    Ladder_score
FROM
    report_2021
WHERE
    Explained_by_Log_GDP_per_capita > (SELECT 
            AVG(Explained_by_Log_GDP_per_capita)
        FROM
            report_2021)
ORDER BY Explained_by_Log_GDP_per_capita;

# Table shows countries which are above avergae GDP for 2020
SELECT 
    ranks,
    country,
    Explained_by_Log_GDP_per_capita,
    Ladder_score
FROM
    report_2020
WHERE
    Explained_by_Log_GDP_per_capita > (SELECT 
            AVG(Explained_by_Log_GDP_per_capita)
        FROM
            report_2020)
ORDER BY Explained_by_Log_GDP_per_capita;

# considering all the parameter to check which country tops the chart

# country ranking based on social support score for the three year.
SELECT 
    RTW.ranks,
    RTW.country,
    RTW.explained_by_social_support AS Social_Support22,
    RTO.ranks,
    RTO.country,
    RTO.explained_by_social_support AS Social_Support21,
    RTT.ranks,
    RTT.country,
    RTT.explained_by_social_support AS Social_Support20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.explained_by_social_support , RTO.explained_by_social_support , RTT.explained_by_social_support;
 
 #  country ranking based on healthy life score for the three year.
 SELECT 
    RTW.ranks,
    RTW.country,
    RTW.Explained_by_Healthy_life_expectancy AS Healthy_life22,
    RTO.ranks,
    RTO.country,
    RTO.Explained_by_Healthy_life_expectancy AS Healthy_life21,
    RTT.ranks,
    RTT.country,
    RTT.Explained_by_Healthy_life_expectancy AS Healthy_life20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.Explained_by_Healthy_life_expectancy , RTO.Explained_by_Healthy_life_expectancy , RTT.Explained_by_Healthy_life_expectancy;
 
 #  country ranking based on Freefome to make life choice score for the three year. 
  SELECT 
    RTW.ranks,
    RTW.country,
    RTW.explained_by_freedom_to_make_life_choices AS Life_choice22,
    RTO.ranks,
    RTO.country,
    RTO.explained_by_freedom_to_make_life_choices AS life_choice21,
    RTT.ranks,
    RTT.country,
    RTT.explained_by_freedom_to_make_life_choices AS life_choice20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.explained_by_freedom_to_make_life_choices , RTO.explained_by_freedom_to_make_life_choices , RTT.explained_by_freedom_to_make_life_choices;
 
 #  country ranking based on Generosity score for the three year. 
   SELECT 
    RTW.ranks,
    RTW.country,
    RTW.Explained_by_Generosity AS generosity22,
    RTO.ranks,
    RTO.country,
    RTO.Explained_by_Generosity AS genrosity21,
    RTT.ranks,
    RTT.country,
    RTT.Explained_by_Generosity AS generosity20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.Explained_by_Generosity , RTO.Explained_by_Generosity , RTT.Explained_by_Generosity;
 
  #  country ranking based on GDP for the three year. 
   SELECT 
    RTW.ranks,
    RTW.country,
    RTW.Explained_by_GDP_per_capita AS GDP22,
    RTO.ranks,
    RTO.country,
    RTO.Explained_by_Log_GDP_per_capita AS GDP21,
    RTT.ranks,
    RTT.country,
    RTT.Explained_by_Log_GDP_per_capita AS GDP20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.Explained_by_GDP_per_capita , RTO.Explained_by_LOG_GDP_per_capita , RTT.Explained_by_LOG_GDP_per_capita;
  
  ## Please note check the accuracy of the data 
  
    #  country ranking based on corruption for the three year. 
     SELECT 
    RTW.ranks,
    RTW.country,
    RTW.Explained_by_Perceptions_of_corruption AS corruption22,
    RTO.ranks,
    RTO.country,
    RTO.Explained_by_Perceptions_of_corruption AS corruption21,
    RTT.ranks,
    RTT.country,
    RTT.Explained_by_Perceptions_of_corruption AS corruption20
FROM
    report_2022 RTW,
    report_2021 RTO,
    report_2020 RTT
WHERE
    RTW.ranks = RTO.ranks
        AND RTO.ranks = RTT.ranks
ORDER BY RTW.Explained_by_Perceptions_of_corruption , RTO.Explained_by_Perceptions_of_corruption , RTT.Explained_by_Perceptions_of_corruption;
  
# Below table answers the query if only social support, healthy life, freedon to make life choice,
# generosity is taken into consideration how does the report changes for 2022.

Select row_number() over (order by new_happiness_score) as ranks_order, country, new_happiness_score
from (select country,(Explained_by_Social_support + 
	Explained_by_Healthy_life_expectancy+ 
	explained_by_Freedom_to_make_life_choices + 
    Explained_by_Generosity)
    as new_happiness_score from report_2022) as subquery
    order by new_happiness_score desc;
    
    # While calculating happiness report we have not inculeded dystopia  and resduial column since this data is imagenary. 
    # So while calculating hapiness report we taken into consideration 4 factor and ignored dystopia and residual.
    
    # # Below table answers the query if only social support, healthy life, freedon to make life choice,
# generosity is taken into consideration how does the report changes for 2022.

    Select row_number() over (order by new_happiness_score) as ranks_order, country, new_happiness_score
from (select country,(Explained_by_Social_support + 
	Explained_by_Healthy_life_expectancy+ 
	explained_by_Freedom_to_make_life_choices + 
    Explained_by_Generosity)
    as new_happiness_score from report_2021) as subquery
    order by new_happiness_score desc;
    
     # Below table answers the query if only social support, healthy life, freedon to make life choice,
	# generosity is taken into consideration how does the report changes for 2022.
    
    Select row_number() over (order by new_happiness_score) as ranks_order, country, new_happiness_score
from (select country,(Explained_by_Social_support + 
	Explained_by_Healthy_life_expectancy+ 
	explained_by_Freedom_to_make_life_choices + 
    Explained_by_Generosity)
    as new_happiness_score from report_2020) as subquery
    order by new_happiness_score desc;
    
    
    # considered only Explained_by_GDP_per_capita+ Explained_by_GDP_per_capita+
    #Explained_by_Perceptions_of_corruption  to calcualte ranks
    
     Select row_number() over (order by combined_data) as ranks_order, country, combined_data 
		from (select country, Explained_by_GDP_per_capita+ 
		Explained_by_Perceptions_of_corruption 
		 as combined_data from report_2022) as subquery
    order by combined_data desc;
    
    Select row_number() over (order by combined_data) as ranks_order, country, combined_data 
		from (select country, Explained_by_log_GDP_per_capita+ 
		Explained_by_Perceptions_of_corruption 
		 as combined_data from report_2021) as subquery
    order by combined_data desc;
    
    Select row_number() over (order by combined_data) as ranks_order, country, combined_data 
		from (select country, Explained_by_log_GDP_per_capita+ 
		Explained_by_Perceptions_of_corruption 
		 as combined_data from report_2020) as subquery
    order by combined_data;
    
    # changing the happiness score of the countries by making their GDP equal to averag of all the countries of the last 20 countries. 
    SELECT 
	ranks,
    country, 
    Explained_by_GDP_per_capita,
    CASE 
        WHEN Explained_by_GDP_per_capita < (AVG(Explained_by_GDP_per_capita) OVER ()) 
        THEN Explained_by_GDP_per_capita + (AVG(Explained_by_GDP_per_capita) OVER () - Explained_by_GDP_per_capita)
        ELSE Explained_by_GDP_per_capita 
    END AS column_changed
FROM 
    report_2022
    order by ranks desc
    limit 20;
    
    # 2021
     SELECT 
	ranks,
    country, 
    Explained_by_log_GDP_per_capita,
    CASE 
        WHEN Explained_by_log_GDP_per_capita < (AVG(Explained_by_log_GDP_per_capita) OVER ()) 
        THEN Explained_by_log_GDP_per_capita + (AVG(Explained_by_log_GDP_per_capita) OVER () - Explained_by_log_GDP_per_capita) 
        ELSE Explained_by_log_GDP_per_capita 
    END AS column_changed
FROM 
    report_2021
    order by ranks desc
    limit 20;
    
    SELECT 
	ranks,
    country, 
    Explained_by_log_GDP_per_capita,
    CASE 
        WHEN Explained_by_log_GDP_per_capita < (AVG(Explained_by_log_GDP_per_capita) OVER ()) 
        THEN Explained_by_log_GDP_per_capita + (AVG(Explained_by_log_GDP_per_capita) OVER () - Explained_by_log_GDP_per_capita) 
        ELSE Explained_by_log_GDP_per_capita 
    END AS column_changed
FROM 
    report_2020
    order by ranks desc
    limit 20;
    
    # comapring the happiness score and GDP after increasing for the year 2022
    	SELECT 
    ranks,
    country,
    Happiness_score,
    Explained_by_GDP_per_capita,
    Explained_by_GDP_per_capita + 1.4104452 - Explained_by_GDP_per_capita AS updated_GDP,
    happiness_score + (Explained_by_GDP_per_capita + 1.4104452 - Explained_by_GDP_per_capita) - Explained_by_GDP_per_capita AS updates_happiness_score
FROM
    report_2022
ORDER BY ranks DESC
LIMIT 20;
        
	# comapring the happiness score and GDP after increasing for the year 2021
      SELECT 
    ranks,
    country,
    ladder_score,
    Explained_by_log_GDP_per_capita,
    Explained_by_log_GDP_per_capita + 0.9771611 - Explained_by_log_GDP_per_capita AS updated_GDP,
    ladder_score + (Explained_by_log_GDP_per_capita + 0.9771611 - Explained_by_log_GDP_per_capita) - Explained_by_log_GDP_per_capita AS updates_happiness_score
FROM
    report_2021
ORDER BY ranks DESC
LIMIT 20;
        
	
    # comapring the happiness score and GDP after increasing for the year 2020
   select ranks,country,ladder_score, Explained_by_log_GDP_per_capita,
		Explained_by_log_GDP_per_capita + 0.8687778 - Explained_by_log_GDP_per_capita as updated_GDP,
		ladder_score + (Explained_by_log_GDP_per_capita + 0.8687778 - Explained_by_log_GDP_per_capita)
		- Explained_by_log_GDP_per_capita as updates_happiness_score
		from report_2021
		order by ranks desc
		limit 20;
    
    
    # Making the healthy_life score equal to the average for bottom 20 countries to check happiness score. 
    
    # 2022
        select ranks, country, happiness_score, Explained_by_Healthy_life_expectancy from report_2022
        where Explained_by_Healthy_life_expectancy < 0.5861712
        order by ranks desc;
        
        
        select country,Happiness_score,ranks, Explained_by_Healthy_life_expectancy,
		Explained_by_Healthy_life_expectancy + 0.5861712 - Explained_by_Healthy_life_expectancy as updated_health_score,
		happiness_score + (Explained_by_Healthy_life_expectancy + 0.5861712 - Explained_by_Healthy_life_expectancy)
		- Explained_by_Healthy_life_expectancy as updates_happiness_score
		from report_2022
        where Explained_by_Healthy_life_expectancy < 0.5861712
		order by ranks desc;
        
	# 2021
     SELECT 
    ranks,
    country,
    happiness_score,
    Explained_by_Healthy_life_expectancy
FROM
    report_2022
WHERE
    Explained_by_Healthy_life_expectancy < 0.5201611
ORDER BY ranks DESC;
        
        
        SELECT 
    ranks,
    country,
    ladder_score,
    Explained_by_Healthy_life_expectancy,
    Explained_by_Healthy_life_expectancy + 0.5201611 - Explained_by_Healthy_life_expectancy AS updated_health_score,
    ladder_score + (Explained_by_Healthy_life_expectancy + 0.5201611 - Explained_by_Healthy_life_expectancy) - Explained_by_Healthy_life_expectancy AS updates_happiness_score
FROM
    report_2021
WHERE
    Explained_by_Healthy_life_expectancy < 0.5201611
ORDER BY ranks DESC;
        
	# 2020
    
     SELECT 
    ranks,
    country,
    happiness_score,
    Explained_by_Healthy_life_expectancy
FROM
    report_2022
WHERE
    Explained_by_Healthy_life_expectancy < 0.6928824
ORDER BY ranks DESC;
        
        
        SELECT 
    ranks,
    country,
    ladder_score,
    Explained_by_Healthy_life_expectancy,
    Explained_by_Healthy_life_expectancy + 0.6928824 - Explained_by_Healthy_life_expectancy AS updated_health_score,
    ladder_score + (Explained_by_Healthy_life_expectancy + 0.6928824 - Explained_by_Healthy_life_expectancy) - Explained_by_Healthy_life_expectancy AS updates_happiness_score
FROM
    report_2020
WHERE
    Explained_by_Healthy_life_expectancy < 0.6928824
ORDER BY ranks DESC;