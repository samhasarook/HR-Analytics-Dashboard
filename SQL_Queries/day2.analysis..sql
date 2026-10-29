
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE WHEN Attrition = 'Yes'
        THEN 1 ELSE 0 END
    ) AS employees_left,
    ROUND(
        100.0 * SUM(
            CASE WHEN Attrition = 'Yes'
            THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY age_group
ORDER BY attrition_rate_pct DESC;


SELECT
    CASE
        WHEN MonthlyIncome < 3000 THEN 'Low income'
        WHEN MonthlyIncome < 6000 THEN 'Medium income'
        ELSE 'High income'
    END AS income_group,
    COUNT(*) AS total_employees,
    SUM(
        CASE WHEN Attrition = 'Yes'
        THEN 1 ELSE 0 END
    ) AS employees_left,
    ROUND(
        100.0 * SUM(
            CASE WHEN Attrition = 'Yes'
            THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY income_group
ORDER BY attrition_rate_pct DESC;


SELECT
    BusinessTravel,
    COUNT(*) AS total_employees,
    SUM(
        CASE WHEN Attrition = 'Yes'
        THEN 1 ELSE 0 END
    ) AS employees_left,
    ROUND(
        100.0 * SUM(
            CASE WHEN Attrition = 'Yes'
            THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY BusinessTravel
ORDER BY attrition_rate_pct DESC;


SELECT
    COUNT(*) AS total_employees,
    SUM(
        CASE WHEN Attrition = 'Yes'
        THEN 1 ELSE 0 END
    ) AS employees_left,
    SUM(
        CASE WHEN Attrition = 'No'
        THEN 1 ELSE 0 END
    ) AS employees_stayed,
    ROUND(
        100.0 * SUM(
            CASE WHEN Attrition = 'Yes'
            THEN 1 ELSE 0 END
        ) / COUNT(*), 2
    ) AS overall_attrition_rate_pct
FROM hr_employees;
