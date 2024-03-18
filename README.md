## Introduction

Dive into the data analytics job market. This project explores top paying roles and in demand skills within the data analytics field, with a particular focus on the UK job market.

SQL queires? Check them out here: [project_sql_folder](/project_sql/)

## 5 Questions answered by the SQL queries

1. Top paying jobs in data analyst?
3. What skills are required for the top paying data analyst jobs?
3. Top 25 skills and tools based on best paid Data Analyst salaries in the UK?
4. What are the 5 most in-demand skills for data analysts in the UK?
5. Optimal skills to learn (highest demand and highest paid skills) when looking for data analysis work in the UK?

# Tools Used

- **SQL**
- **PostgreSQL**
- **Visual Studio Code**
- **Git & Github**

## The analysis

### Query1

'''sql
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
'''
[Analysis](<project_sql/analysis_assets/Screenshot 2024-03-18 152245.png>)



