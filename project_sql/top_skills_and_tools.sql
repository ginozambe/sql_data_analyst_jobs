/*
 Top 25 skills and tools based on Best paid Data Analyst salaries in the UK
 */
SELECT skills,
    job_location,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_location LIKE '%UK%'
GROUP BY skills,
    job_location
ORDER BY avg_salary DESC
LIMIT 25