/*
 What are the best skills to learn (highest demand and highest paid skills) when looking for data analysis work in the UK?
 */
WITH skills_demand AS (
    SELECT skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count,
        ROW_NUMBER() OVER (
            ORDER BY COUNT(skills_job_dim.job_id) DESC
        ) AS row_num
    FROM job_postings_fact
        INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
        INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
    WHERE job_title_short = 'Data Analyst'
        AND salary_year_avg IS NOT NULL
        AND job_location LIKE '%UK%'
    GROUP BY skills_dim.skill_id,
        skills_dim.skills
)
SELECT skills,
    demand_count
FROM skills_demand
WHERE row_num <= 5
ORDER BY demand_count DESC;