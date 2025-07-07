# 📊 Data Analyst Job Market SQL Analysis

## 📌 Introduction

I started this project to build up my SQL portfolio and get some real hands-on experience.  
Instead of just following tutorials, I wanted to explore something practical and relevant — so I chose to dive into the data analyst job market.

This project looks into:
- Top-paying jobs 💰
- The most common and high-paying skills 🔧
- What’s really worth learning to land better roles 📈

🔍 SQL Queries: [project_sql_for_sharing](/project_sql_for_sharing/)  
📁 Dataset: [Google Drive - CSV Files](https://drive.google.com/file/d/15gLH5R3ZN4HE7mxNLHvGt7Wk_kqYp_Xc/view?usp=sharing)

---

## 🔎 Background

This project is about answering real questions that I had as a student preparing for a career in data analytics:

> *What skills should I focus on learning? What jobs actually pay well? What tools do companies want in a data analyst?*

So I used SQL to break down job posting data and answer those questions with actual evidence.

---

## ❓ Key Questions I Wanted to Answer

1. What are the **top-paying** data analyst jobs?
2. What **skills** are required for those high-paying jobs?
3. What are the **most in-demand** skills for data analysts?
4. Which skills are associated with **higher salaries**?
5. What are the **most optimal skills** to learn?

---

## 🛠️ Tools I Used

- **SQL** – to query and explore the job data  
- **PostgreSQL** – for handling and storing the database  
- **VS Code** – for writing and testing SQL scripts  
- **Git & GitHub** – for version control and sharing my work  

---

## 📊 The Analysis

### 1. Top-Paying Jobs
```sql
SELECT job_title, salary_year_avg, company_name
FROM job_postings_fact
JOIN company_dim USING (company_id)
WHERE job_title_short = 'Data Analyst'
  AND job_location = 'Anywhere'
  AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;
```

### 2. Skills Required for Top-Paying Jobs
```sql
WITH top_jobs AS (
  SELECT job_id
  FROM job_postings_fact
  WHERE job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
  ORDER BY salary_year_avg DESC
  LIMIT 10
)
SELECT skills
FROM top_jobs
JOIN skills_job_dim USING (job_id)
JOIN skills_dim USING (skill_id);
```

### 3. Most In-Demand Skills
```sql
SELECT skills, COUNT(*) AS demand_count
FROM job_postings_fact
JOIN skills_job_dim USING (job_id)
JOIN skills_dim USING (skill_id)
WHERE job_title_short = 'Data Analyst'
  AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY demand_count DESC
LIMIT 5;
```

### 4. Skills with Highest Salaries
```sql
SELECT skills, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim USING (job_id)
JOIN skills_dim USING (skill_id)
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 10;
```

### 5. Most Optimal Skills (High Salary + High Demand)
```sql
SELECT skills, COUNT(*) AS demand_count, ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
JOIN skills_job_dim USING (job_id)
JOIN skills_dim USING (skill_id)
WHERE job_title_short = 'Data Analyst'
  AND salary_year_avg IS NOT NULL
  AND job_work_from_home = TRUE
GROUP BY skills
HAVING COUNT(*) > 10
ORDER BY avg_salary DESC
LIMIT 10;
```

---

## 📘 What I Learned

- How to build SQL queries to answer business questions
- How to use `JOIN`, `GROUP BY`, `CTE`, and `HAVING` clauses effectively
- How to combine different metrics (salary + demand) for better insights
- How to clean and analyze structured job data

---

## ✅ Conclusion

- **SQL** is the most important skill — both high paying and high demand
- **Python, Excel, Tableau** are essential to most data analyst jobs
- Learning **cloud tools** (like Snowflake, BigQuery, AWS) can increase salary potential
- Focus on skills that are **both demanded and well-paid** for best ROI

---

## 📁 Resources

- 📂 SQL Scripts: [`project_sql_for_sharing`](/project_sql_for_sharing/)  
- 📊 Dataset: [CSV on Google Drive](https://drive.google.com/file/d/15gLH5R3ZN4HE7mxNLHvGt7Wk_kqYp_Xc/view?usp=sharing)

---

## 📈 Visuals Coming Soon

- Top 10 job salaries (bar chart)  
- Most required skills for high-paying jobs  
- Most in-demand skills  
- Highest salary by skill  
- Optimal skills (salary vs demand scatter plot)  

