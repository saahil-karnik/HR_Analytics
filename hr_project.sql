-- 1. Which three departments had the highest satisfaction scores, and which three had the lowest satisfaction scores?
SELECT 
	dept,
	round(AVG(satisfaction_level),2) AS avg_satisfaction
FROM hr_project.`employee attrition`
GROUP BY dept
ORDER BY avg_satisfaction DESC;


-- 2. What is the relationship between salary and satisfaction score?
SELECT * 
FROM hr_project.`employee attrition`;

SELECT 
	salary,
    round(AVG(satisfaction_level),2) AS avg_satisfaction
FROM hr_project.`employee attrition`
GROUP BY salary
ORDER BY avg_satisfaction;
    


-- 3. How did the top two and bottom two depts perform in the following arears
-- 'support'
-- 'management' top_dept

-- 'hr'
-- 'accounting' lower_dept

-- a. last_evaluation

-- b. number_project

-- c. average_montly_hours

-- d. time_spend_company

-- d. time_spend_company

-- e. Work_accident

-- f. promotion_last_5years
SELECT 
    CASE
     WHEN dept in ('support', 'management') THEN 'top_dept'
     WHEN dept in ('hr', 'accounting') THEN 'lower_dept'
	END as top_bot,
    count(`Emp ID`) as number_of_emp,
    round(avg(last_evaluation),2) as avg_last_evaluation,
    round(avg(number_project),1) as avg_projects,
    round(avg(average_montly_hours),2) as hours_worked,
    round(avg(time_spend_company),2) as time_at_company,
    round(avg(Work_accident),2) as avg_num_accidents,
    round(avg(promotion_last_5years),2) as avg_num_proms
FROM hr_project.`employee attrition`
WHERE dept IN ('support', 'management','hr', 'accounting')
GROUP BY top_bot;