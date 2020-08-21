/*
1.
Question: How many users completed an exercise in their first month per monthly cohort?
Answer: Create two sub-queries.  The first sub-query will count the number of users when grouped by 
        monthly cohort.  The second subquery will join the users table with the exercises table, assign users 
        to a monthly cohort, and then count the unique user_id's associated with exercise completion within first 
        month of signing up, grouped by monthly cohort.  Then join the sub-queries and divide the successful users by 
        the total users, grouped by monthly cohort, ordered chronologically.
Assumptions: Date is stored as a timestamp data-type.
*/

SELECT usersuccesses.cohort_exercise_completion_size / cohorts.monthly_cohort_size AS exercise_completion_rate,
       usersuccesses.monthly_cohort

FROM (
  SELECT 
    CONCAT(EXTRACT YEAR FROM 'created_at', "_", EXTRACT MONTH FROM 'created_at') AS 'monthly_cohort',
    COUNT('monthly_cohort') AS "monthly_cohort_size"
  FROM 'users'
  ) cohorts

FULL JOIN (
  SELECT 
    CONCAT(EXTRACT YEAR FROM 'created_at', "_", EXTRACT MONTH FROM 'created_at') AS 'monthly_cohort',
    COUNT(DISTINCT "user_id") AS "cohort_exercise_completion_size"
  FROM 'users'
  LEFT JOIN 'exercises' 
  ON users.user_id = exercises.user_id
  WHERE exercises.exercise_completion_date <= DATEADD(MONTH, 1, users.created_at)
  GROUP BY 'monthly_cohort'
  ) user_successes

ON cohorts.monthly_cohort = user_successes.monthly_cohort
ORDER BY usersuccesses.monthly_cohort;

/*
2.
Question: How many users completed a given amount of exercises?
Answer: First, create a sub-query that count how many activities each user has completed by grouping by user_id, 
        then add a field that places each user into a range, group users by their respected ranges by using a CASE WHEN 
        query, and count the number of users per range.  
Assumptions: The ranges selected here may be irrelevant to the dataset range, but is a good starting place and suggested 
            by the question.
*/

SELECT count(sub.user_id) AS 'number_of_users'
  CASE WHEN sub.count_activities_completed <= 100 AND sub.count_activities_completed >= 1 THEN '1-100'
       WHEN sub.count_activities_completed <= 1000 AND sub.count_activities_completed > 100 THEN '101 - 1000'
       WHEN sub.count_activities_completed <= 10000 AND sub.count_activities_completed > 1000 THEN '1001 - 10,000'
       ELSE THEN '10,001+' END AS 'number_of_completed_activities_group'  
        
FROM 
  (
  SELECT 'user_id', COUNT('user_id') as 'count_activities_completed'
  FROM 'exercises'
  GROUP BY 'user_id'
  ) sub
    
GROUP BY 'number_of_completed_activities_group'  
ORDER BY 'number_of_completed_activities_group';  

/*
3. 
Question: Which organizations have the most severe patient population?
Answer: First, join tables on provider_ids, then obtain average by grouping on organization name, 
        and return result in descending average phq9 score order, with a limit at 5 to isolate top 
        5 organizations with most severe patients on average.
*/

SELECT SUM(sub.score)/COUNT(sub.score) AS 'average_phq9', sub.organization_name

FROM 
  (
  SELECT 'Providers'.provider_id, 'Providers'.organization_name AS 'organization_name', 
         "Phq9".provider_id, "Phq9".score AS 'score'
  FROM 'Providers'
  JOIN 'Phq9'
  ON 'Providers'.provider_id = "Phq9".provider_id
  ) sub
    
GROUP BY sub.organization_name
ORDER BY 'average_phq9' DESC
LIMIT 5;