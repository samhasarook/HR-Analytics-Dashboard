
SELECT COUNT(*) AS total_employees
FROM hr_employees;


SELECT Attrition, COUNT(*) AS employee_count
FROM hr_employees
GROUP BY Attrition;


SELECT
    Attrition,
    COUNT(*) AS employee_count
FROM hr_employees
GROUP BY Attrition;


SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(
        CASE WHEN Attrition = 'Yes'
        THEN 1 ELSE 0 END
    ) AS employees_left
FROM hr_employees
GROUP BY Department
ORDER BY employees_left DESC;


SELECT
    Department,
    COUNT(*) AS total_employees,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) AS employees_left,
    ROUND(
        100.0 * SUM(CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY Department
ORDER BY attrition_rate_pct DESC;


SELECT
    OverTime,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY OverTime
ORDER BY attrition_rate_pct DESC;


SELECT
    JobRole,
    COUNT(*) AS total_employees,
    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate_pct
FROM hr_employees
GROUP BY JobRole
HAVING COUNT(*) >= 20
ORDER BY attrition_rate_pct DESC;


SELECT COUNT(*) AS total_employees
FROM hr_employees;


SELECT
    CASE
        WHEN YearsAtCompany <= 2 THEN '0-2 years'
        WHEN YearsAtCompany <= 5 THEN '3-5 years'
        WHEN YearsAtCompany <= 10 THEN '6-10 years'
        ELSE '11+ years'
    END AS tenure_group,

    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate_pct

FROM hr_employees

GROUP BY tenure_group
ORDER BY attrition_rate_pct DESC;


SELECT
    JobSatisfaction,
    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate_pct

FROM hr_employees

GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


SELECT
    WorkLifeBalance,
    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN Attrition = 'Yes' THEN 1
            ELSE 0
        END
    ) AS employees_left,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS attrition_rate_pct

FROM hr_employees

GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


SELECT
    COUNT(*) AS total_employees,
    COUNT(DISTINCT EmployeeNumber) AS unique_employees
FROM hr_employees;


SELECT
    SUM(CASE WHEN Department IS NULL
        THEN 1 ELSE 0 END) AS missing_department,
    SUM(CASE WHEN Attrition IS NULL
        THEN 1 ELSE 0 END) AS missing_attrition,
    SUM(CASE WHEN JobRole IS NULL
        THEN 1 ELSE 0 END) AS missing_job_role,
    SUM(CASE WHEN YearsAtCompany IS NULL
        THEN 1 ELSE 0 END) AS missing_tenure
FROM hr_employees;
