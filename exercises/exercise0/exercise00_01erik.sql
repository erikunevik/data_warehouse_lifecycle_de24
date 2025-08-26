-- Exercise 0

-- A)

SHOW WAREHOUSES;

SHOW DATABASES;

SHOW SCHEMAS;

USE DATABASE GOOGLE_KEYWORDS_SEARCH_DATASET__DISCOVER_ALL_SEARCHES_ON_GOOGLE;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA DATAFEEDS;
SHOW TABLES IN SCHEMA INFORMATION_SCHEMA;

USE SCHEMA DATAFEEDS;

SELECT * FROM GOOGLE_KEYWORDS;

-- How many platforms are there?

SELECT DISTINCT PLATFORM
FROM GOOGLE_KEYWORDS;

-- Which different referral types are there?

SELECT DISTINCT REFERRAL_TYPE 
FROM GOOGLE_KEYWORDS;

-- How many different clean_landing pages are there?

SELECT DISTINCT CLEAN_LANDINGPAGE 
FROM GOOGLE_KEYWORDS;

-- Top 10 landing pages

SELECT CLEAN_LANDINGPAGE, COUNT(*) AS hits
FROM GOOGLE_KEYWORDS
GROUP BY CLEAN_LANDINGPAGE
ORDER BY hits DESC
LIMIT 10;

-- Top 10 clicks

SELECT 
    KEYWORD,
    SUM(CALIBRATED_CLICKS) AS total_clicks
FROM GOOGLE_KEYWORDS
WHERE IS_QUESTION = 1
GROUP BY KEYWORD
ORDER BY total_clicks DESC
LIMIT 10;


-- B)
DESCRIBE TABLE GOOGLE_KEYWORDS;

--C)

SELECT * FROM GOOGLE_KEYWORDS;

--D)
SELECT
    MIN(DATE) AS first_search_date,
    MAX(DATE) AS last_search_date
FROM GOOGLE_KEYWORDS;

--E)

SELECT 
KEYWORD, COUNT(*) AS top_10_keywords,
FROM GOOGLE_KEYWORDS
GROUP BY
KEYWORD
ORDER BY
top_10_keywords DESC
LIMIT 10;

--F)
SELECT DISTINCT KEYWORD FROM GOOGLE_KEYWORDS;

--G) 

SELECT * FROM GOOGLE_KEYWORDS;

SELECT DISTINCT PLATFORM
FROM GOOGLE_KEYWORDS;

SELECT 
    PLATFORM,
    SUM(CALIBRATED_USERS) AS total_users
FROM GOOGLE_KEYWORDS
GROUP BY PLATFORM
ORDER BY total_users DESC;

--H)

SELECT 
    KEYWORD, 
    COUNT(*) AS top_20_keywords
FROM GOOGLE_KEYWORDS
WHERE COUNTRY = 752 
GROUP BY KEYWORD
ORDER BY top_20_keywords DESC
LIMIT 100;

--I)

SELECT 
    KEYWORD, 
    COUNT(*) AS spotify_counts,
    COUNTRY
FROM GOOGLE_KEYWORDS
WHERE KEYWORD ILIKE '%spotify%'
GROUP BY 
KEYWORD,
COUNTRY
ORDER BY spotify_counts DESC
LIMIT 10;

--J)

    -- Top 10 searched for keywords with the term music by calibrated clicks

    SELECT 
        SUM(CALIBRATED_CLICKS) AS top_music_clicks,
        KEYWORD,
        FROM GOOGLE_KEYWORDS
        WHERE KEYWORD ILIKE '%music%'
        GROUP BY
        KEYWORD
        ORDER BY
        top_music_clicks
        DESC
        LIMIT 10;

-- 1

--A) 0.5 credits/day X 30 days = 15 credits

--B) 
    -- 2 X 10 = 20
    -- 1.5 X 10 = 15
    -- 1 X 10 = 10

    -- 20 + 15 + 10 = 45

    -- Answer: The cost will be 45 Credits for 30 days

-- C)

    --Warehouse A XS: 1 x 10 x 30 = 300    
    -- Warehouse B S: 2 x 10 x 30 = 120
    -- Warehouse C M: 4 x 10 x 30 = 120

    -- 300 + 120 + 120 = 540
    -- Answer: My warehouses will spend 540 Studycredits along the month 

-- D)

    -- Day 0-10: 1 x 10 x 2 x 10 = 200
    -- Day 10-20: 1 x 10 x 3 x 10 = 300
    -- Day 10-20: 1 x 10 x 4 x 10 = 400

    -- 200 + 300 + 400 = 900
    -- Answer: The monthly are 900 credits 


































