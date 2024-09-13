SELECT bank_schema AS bank_schema,
       "SUM(successful_counts)" AS "SUM(successful_counts)",
       "Total_value" AS "Total_value"
FROM
  (SELECT bank_schema AS bank_schema,
          SUM(successful_counts) AS "SUM(successful_counts)",
          SUM(Total_value) AS "Total_value"
   FROM
     (SELECT bank_schema,
             SUM(successful_counts) AS successful_counts,
             SUM(Total_value) AS Total_value
      FROM
        (WITH bank_counts AS
           (SELECT 'Gold' AS bank_schema,
                   COUNT(*) AS successful_counts,
                   SUM(amount) AS Total_value
            FROM Gold.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
            UNION ALL SELECT 'Silver' AS bank_schema,
                             COUNT(product) AS successful_counts,
                             SUM(amount) AS Total_value
            FROM Silver.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND product NOT IN ('Airtel Airtime',
                                  'Etisalat Airtime',
                                  'GLO Airtime',
                                  'MTN airtime')
            UNION ALL SELECT 'Bronze' AS bank_schema,
                             COUNT(product) AS successful_counts,
                             SUM(amount) AS Total_value
            FROM Bronze.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND product NOT IN ('Airtel Airtime',
                                  'Airtel DATA',
                                  'Etisalat Airtime',
                                  'Etisalat DATA',
                                  'GLO Airtime',
                                  'GLO DATA',
                                  'MTN airtime',
                                  'MTN DATA')
            UNION ALL SELECT 'Diamond' AS bank_schema,
                             COUNT(product) AS successful_counts,
                             SUM(amount) AS Total_value
            FROM Diamond.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND product NOT IN ('Airtel Airtime',
                                  'Etisalat Airtime',
                                  'GLO Airtime',
                                  'MTN airtime')
            UNION ALL SELECT 'Platinum' AS bank_schema,
                             COUNT(product) AS successful_counts,
                             SUM(amount) AS Total_value
            FROM Platinum.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND product NOT IN ('Airtel Airtime',
                                  'Airtel Data',
                                  'Etisalat Airtime',
                                  'Etisalat Data',
                                  'Glo Airtime',
                                  'Glo Data',
                                  'Mtn Airtime',
                                  'MTN Data')
            UNION ALL SELECT 'Iron' AS bank_schema,
                             COUNT(product) AS successful_counts,
                             SUM(amount) AS Total_value
            FROM Iron.itransactions
            WHERE status = '0'
              AND date >= CURRENT_DATE - INTERVAL '1 day'
              AND date < CURRENT_DATE
              AND product NOT IN ('9mobile (etisalat) Airtime',
                                  'Airtel Airtime',
                                  'Airtel Data',
                                  'DATA cbc:068 op:etisalat',
                                  'GLO Airtime',
                                  'GLO Data',
                                  'MTN Airtime',
                                  'MTN Data') ) SELECT bank_schema,
                                                       successful_counts,
                                                       Total_value
         FROM bank_counts) AS virtual_table
      GROUP BY bank_schema
      ORDER BY SUM(successful_counts) DESC
      LIMIT 1000) AS virtual_table
   GROUP BY bank_schema
   ORDER BY SUM(successful_counts) DESC
   LIMIT 1000) AS virtual_table
LIMIT 1000;
