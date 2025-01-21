
-- 
SELECT company_name, goal, pledged, backers_count
	FROM campaign 
	WHERE pledged < goal AND backers_count < 50
ORDER BY backers_count ASC;

--
SELECT cat.category, SUM(c.pledged) AS total_funding
	FROM campaign c
	JOIN category cat ON c.category_ids = cat.category_ids
	GROUP BY cat.category
ORDER BY total_funding DESC LIMIT 3;

--
SELECT company_name, goal, pledged, (pledged / goal * 100) AS percent_funded
FROM campaign
WHERE goal > 0
ORDER BY percent_funded
DESC LIMIT 10;

-- Which country had the most successfull campaigns
SELECT country, 
       COUNT(cam.cf_id) AS total_campaigns, 
       SUM(CASE WHEN cam.outcome = 'successful' THEN 1 ELSE 0 END) AS successful_campaigns
FROM campaign cam
GROUP BY country
ORDER BY total_campaigns DESC;