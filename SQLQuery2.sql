create database hr_analysis
use hr_analysis

go
select * from Hr_Analysis

--Attrition by department--
SELECT 
    Department,
    SUM(CAST(Attrition AS INT)) AS Employees_Left,
    COUNT(*) AS Total_Employees,
    ROUND(100.0 * SUM(CAST(Attrition AS INT)) / COUNT(*), 2) AS AttritionRate_Percent
FROM Hr_Analysis
GROUP BY Department
ORDER BY AttritionRate_Percent DESC;

--Average Salary Per JOB ROLE--
SELECT 
    JobRole,
    ROUND(AVG(MonthlyIncome), 2) AS Avg_Monthly_Salary
FROM Hr_Analysis
GROUP BY JobRole
ORDER BY Avg_Monthly_Salary DESC;

--Top Performers by Department--
SELECT 
    Department,
    JobRole,
    AVG(PerformanceRating) AS AvgPerformanceRating
FROM Hr_Analysis
where PerformanceRating = 4
GROUP BY Department, JobRole
ORDER BY AvgPerformanceRating DESC;
