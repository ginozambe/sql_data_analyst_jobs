## Introduction

Dive into the data analytics job market. This project explores top-paying roles and in-demand skills within data analytics, focusing on the UK job market.

SQL queries? Check them out here: [project_sql_folder](/project_sql/)

## 5 Questions answered by the SQL queries

1. Top paying jobs in data analysis?
3. What skills are required for the top-paying data analyst jobs?
3. Top 25 skills and tools based on best-paid Data Analyst salaries in the UK?
4. What are the 5 most in-demand skills for data analysts in the UK?
5. What are the best skills to learn (highest demand and highest paid skills) when looking for data analysis work in the UK?

# Tools Used

- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

## The analysis

### Query1

```SQL
SELECT job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10
```

![Analysis](<project_sql/analysis_assets/Screenshot 2024-03-18 152245.png>)

### Query1

```SQL
WITH top_paying_jobs AS (
    SELECT job_id,
        job_title,
        salary_year_avg,
        job_posted_date,
        company_dim.name AS company_name
    FROM job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY salary_year_avg DESC
    LIMIT 10
)
SELECT top_paying_jobs.*,
    STRING_AGG(DISTINCT skills_dim.skills, ', ') AS skills
FROM top_paying_jobs
    INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY top_paying_jobs.job_id,
    top_paying_jobs.job_title,
    top_paying_jobs.salary_year_avg,
    top_paying_jobs.job_posted_date,
    top_paying_jobs.company_name
ORDER BY salary_year_avg DESC
LIMIT 25;
```
![Analysis](<project_sql/analysis_assets/Screenshot 2024-03-18 152245.png>)>)


