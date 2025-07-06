/* Question: What are the top skills based on salary? */

SELECT 
    skills,
    ROUND(AVG(salary_year_avg),2) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/*
Top-Paying Skill: SVN stands out with the highest average salary at $400,000, far exceeding all others.

High-Value Emerging Skills: Technologies like Solidity ($179K), Couchbase ($160K), DataRobot ($155K), 
and Golang ($155K) also command strong salaries, reflecting demand in blockchain, AI automation, and backend systems.

AI & DevOps Demand: In-demand tools such as MXNet, PyTorch, TensorFlow, Hugging Face, Airflow, Kafka, Ansible, 
and Terraform offer salaries between $116K–$149K, highlighting lucrative opportunities in AI/ML and cloud infrastructure.
*/