SELECT bank_schema AS bank_schema,
       "SUM(error_counts)" AS "SUM(error_counts)",
       "Total_value" AS "Total_value"
FROM
  (SELECT bank_schema AS bank_schema,
          SUM(error_counts) AS "SUM(error_counts)",
          SUM(Total_value) AS "Total_value"
   FROM
     (SELECT bank_schema,
             SUM(error_counts) AS error_counts,
             SUM(Total_value) AS Total_value
      FROM
        (WITH bank_counts AS
           (SELECT 'Gold' AS bank_schema,
                   COUNT(operation_type) AS error_counts,
                   SUM(amount) AS Total_value
            FROM Gold.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
            UNION ALL SELECT 'Silver' AS bank_schema,
                             COUNT(operation_type) AS error_counts,
                             SUM(amount) AS Total_value
            FROM Silver.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND operation_type NOT IN ('RECHARGE', 'DATA')
            UNION ALL SELECT 'Bronze' AS bank_schema,
                             COUNT(operation_type) AS error_counts,
                             SUM(amount) AS Total_value
            FROM Bronze.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND operation_type NOT IN ('RECHARGE', 'DATA')
            UNION ALL SELECT 'Diamond' AS bank_schema,
                             COUNT(operation_type) AS error_counts,
                             SUM(amount) AS Total_value
            FROM Diamond.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND operation_type NOT IN ('RECHARGE', 'DATA')
            UNION ALL SELECT 'Platinum' AS bank_schema,
                             COUNT(operation_type) AS error_counts,
                             SUM(amount) AS Total_value
            FROM Platinum.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND operation_type NOT IN ('RECHARGE', 'DATA')
            UNION ALL SELECT 'Iron' AS bank_schema,
                             COUNT(operation_type) AS error_counts,
                             SUM(amount) AS Total_value
            FROM Iron.itransactions
            WHERE status = '2'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND operation_type NOT IN ('RECHARGE', 'DATA') ) 
      SELECT bank_schema,
             error_counts,
             Total_value
      FROM bank_counts) AS virtual_table
      GROUP BY bank_schema
      ORDER BY SUM(error_counts) DESC
      LIMIT 1000) AS virtual_table
   GROUP BY bank_schema
   ORDER BY SUM(error_counts) DESC
   LIMIT 1000) AS virtual_table
ORDER BY "SUM(error_counts)" DESC
LIMIT 1000;
