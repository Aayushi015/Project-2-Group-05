-- Number of successful campaigns for each country.
SELECT country,
       COUNT(cam.cf_id) AS total_campaigns,
       SUM(CASE WHEN cam.outcome = 'successful' THEN 1 ELSE 0 END) AS successful_campaigns
FROM campaign cam
GROUP BY country
ORDER BY total_campaigns DESC;
-- Top 10 highest percentage of goal achieved
SELECT company_name, goal, pledge, (pledge / goal * 100) AS percent_funded
FROM campaign
WHERE goal > 0
ORDER BY percent_funded
DESC LIMIT 10;
-- Top 3 categories with the highest total number of funding
SELECT cat.category, SUM(c.pledge) AS total_funding
FROM campaign c
JOIN category cat ON c.category_ids = cat.category_ids
GROUP BY cat.category
ORDER BY total_funding DESC
LIMIT 3;
-- Campaigns that failed to meet their funding goal and had fewer than 50 backers
SELECT company_name, goal, pledge, backers_count
FROM campaign WHERE pledge < goal AND backers_count < 50
ORDER BY backers_count ASC;
-- Top 5 most successful campaigns based on the highest pledge-to-goal ratio
SELECT company_name, project_description, goal, pledge, (pledge / goal) AS success_ratio
FROM campaign
ORDER BY success_ratio DESC
LIMIT 5;














