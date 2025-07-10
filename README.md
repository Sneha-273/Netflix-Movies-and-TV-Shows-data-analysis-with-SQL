# Netflix Movies and TV Shows Data Analysis 
![Netflix logo](https://github.com/user-attachments/assets/85f586f0-4b94-4ea4-835e-928edad07b1a)

# 🏆 About the Project

Welcome to my Netflix Movies & TV Shows Data Analysis project! 🚀
This repository is more than just SQL queries; it’s a journey into data-driven storytelling. Using the Netflix dataset from Kaggle, I solved 20 critical business problems, uncovering insights about trends, audience preferences, and global content strategies.

# 🎯 Core Objectives

✔️ Showcase SQL expertise through well-optimized queries. 

✔️ Derive actionable insights to inform Netflix's content strategies.

✔️ Provide a foundation for business intelligence and decision-making.

# 🛠️ Skills & Tools Used

• Programming Language: SQL

• Database: MySQL 

• Dataset: Netflix Movies and TV Shows dataset from Kaggle

•Key Focus Areas:

    Data Cleaning 
            
    Query Optimization
            
    Business Problem Solving



#  🔗 Dataset
• Source: [Netflix Dataset on Kaggle](https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download)

• Description: The dataset contains information about Netflix's movies and TV shows, including their title, director, cast, country, release year, rating, duration, and genres.

#  📋 Key Features
• Database Design: Created and structured a relational database to analyze Netflix data.

• Querying Proficiency: Solved 20 business questions with optimized SQL queries.

• Insights and Trends: Explored content distribution by genres, countries, and ratings.

• Business Applications: Insights to drive decisions for catalog improvement and audience engagement.

## 📊 Power BI Dashboard Preview

Below is a snapshot of the interactive dashboard built for this project using Power BI:

![Netflix Power BI Dashboard](https://github.com/Sneha-273/Netflix-Movies-and-TV-Shows-data-analysis-with-SQL/blob/main/netflix%20dashboard%20pic.PNG)  

📁 You can download and explore the full `.pbix` report file here:  
[Download Dashboard (.pbix)](https://github.com/your-username/your-repo-name/raw/main/Netflix_Dashboard.pbix) <!-- Replace with actual file path -->


# 🛠️ Business Questions Solved

### 1️⃣ Count the Number of Movies vs TV Shows  
    SELECT type, COUNT(*) AS count  
    FROM netflix_titles  
    GROUP BY type;

### 2️⃣ List All Movies Released in a Specific Year (e.g., 2020)  
    SELECT title 
    FROM netflix 
    WHERE release_year = '2020' AND movie_type = 'movie';
    
### 3️⃣ Identify the Longest Movie
    SELECT title, duration 
    FROM netflix  
    WHERE movie_type = 'movie' 
    ORDER BY LENGTH(duration) DESC
    LIMIT 1;

### 4️⃣ Find All Movies/TV Shows by Director 'Ben Simms'
     SELECT director, title, movie_type
     FROM netflix  
     WHERE director = 'Ben Simms'; 

### 5️⃣ Find All Content Without a Director  
    SELECT title
    FROM netflix
    WHERE director IS NULL OR director = '';

### 6️⃣ List All Movies that are Documentaries  
     SELECT title 
     FROM netflix
     WHERE listed_in LIKE '%Documentaries%';

### 7️⃣ Find All Movies with a Rating Above a Certain Threshold (e.g., '8.0') 
    SELECT title 
    FROM netflix  
    WHERE movie_type = 'movie' AND rating >= '8.0';

### 8️⃣ Find the Most Common Rating for Movies and TV Shows 
     SELECT movie_type, rating, COUNT(*) AS total_count
     FROM netflix
     GROUP BY movie_type, rating
     ORDER BY total_count DESC;

### 9️⃣ Determine the Most Frequently Listed Genres on Netflix  
      SELECT listed_in, COUNT(*) AS Most_Listed_Genres   
      FROM netflix
      GROUP BY listed_in
      ORDER BY Most_Listed_Genres DESC
      LIMIT 10;

### 🔟 Identify the Countries that Contribute the Most Content to Netflix 
     SELECT country, COUNT(*) AS Most_Contributed_Country
     FROM netflix
     WHERE country IS NOT NULL AND country <> ''
     GROUP BY country
     ORDER BY Most_Contributed_Country DESC
     LIMIT 3;

### 1️⃣1️⃣ Find Out Which Actors/Actresses Appear Most Frequently on Netflix 
    SELECT casts, COUNT(*) AS Cast_Count
    FROM netflix
    WHERE casts IS NOT NULL AND casts <> ''
    GROUP BY casts
    ORDER BY Cast_Count DESC
    LIMIT 5;

### 1️⃣2️⃣ Investigate Which Release Years Dominate Netflix’s Catalog  
     SELECT release_year, COUNT(*) AS Release_Year_and_Popularity
     FROM netflix
     GROUP BY release_year
     ORDER BY Release_Year_and_Popularity DESC
     LIMIT 10;

### 1️⃣3️⃣ Explore How the Duration of Movies and TV Shows Varies Across Genres and Ratings  
    SELECT movie_type, AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS Avg_Duration 
    FROM netflix 
    WHERE duration LIKE '%min%' 
    GROUP BY movie_type;

### 1️⃣4️⃣ Calculate the Average Time Gap Between a Title’s Release Year and the Year It Was Added to Netflix  
    SELECT title, release_year, DATE_FORMAT(STR_TO_DATE(date_added, '%M %d, %Y'), '%Y') AS Added_year, 
           (DATE_FORMAT(STR_TO_DATE(date_added, '%M %d, %Y'), '%Y') - release_year) AS Time_gap 
    FROM netflix 
    WHERE date_added IS NOT NULL 
    ORDER BY time_gap DESC 
    LIMIT 10;

### 1️⃣5️⃣ Assess Netflix’s Catalog Diversity by Analyzing the Number of Unique Countries and Genres Represented  
    SELECT COUNT(DISTINCT country) AS Unique_Countries,
        COUNT(DISTINCT listed_in) AS Unique_Genres 
    FROM netflix;

### 1️⃣6️⃣ Identify Which Genres or Countries Netflix Should Invest In  
    SELECT listed_in, country, COUNT(*) AS Invest_countries
    FROM netflix
    GROUP BY listed_in, country
    ORDER BY Invest_countries DESC
    LIMIT 10;

### 1️⃣7️⃣ Determine Whether a Director’s Past Content Trends Can Predict Future Success  
    SELECT director, COUNT(*) AS content_count, GROUP_CONCAT(DISTINCT listed_in) AS genres 
    FROM netflix 
    WHERE director IS NOT NULL AND director <> ''
    GROUP BY director 
    ORDER BY content_count DESC 
    LIMIT 10; 

### 1️⃣8️⃣ Explore How Regional Cultures Influence Netflix’s Catalog Diversity  
    SELECT country, listed_in, COUNT(*) AS content_count 
    FROM netflix 
    GROUP BY country, listed_in 
    ORDER BY content_count DESC 
    LIMIT 20;

### 1️⃣9️⃣ Analyze Whether Certain Ratings Correlate with Higher Viewer Interest 
    SELECT rating, AVG(CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED)) AS avg_duration 
    FROM netflix 
    WHERE duration LIKE '%min%' 
    GROUP BY rating 
    ORDER BY avg_duration DESC;

### 2️⃣0️⃣ Build a Recommendation System Using Genres and Cast Members (e.g., Chris Hemsworth)  
    SELECT title, listed_in, casts 
    FROM netflix 
    WHERE listed_in LIKE '%Action%' 
    OR casts LIKE '%Chris Hemsworth%' 
    LIMIT 10;   

# 🔍 Insights & Highlights

## 🎭 Content Trends
• Drama and Comedy dominate Netflix’s library with over 60% of total titles.

• Content production peaked in 2019, followed by a slight decline in later years.

## 🌍 Global Reach
• United States, India, and Canada lead in content production.

• Regional favorites like Anime and K-Dramas see rising trends in Asian markets.

## 📺 Audience Preferences
• Movies average at 90 minutes, while TV shows typically span 8-10 episodes per season.

# 💡 Why This Project Matters
1. Demonstrates Real-World Problem Solving:

      This project addresses practical business challenges that Netflix or similar streaming platforms face daily, such as content selection, audience engagement, and catalog 
      optimization.

2. Showcases SQL Proficiency:

      From basic filtering to complex aggregations and groupings, the queries in this project demonstrate a comprehensive understanding of SQL, a core skill for any data              analyst.

3. Provides Actionable Insights:

      • Identifying underperforming or overperforming genres/countries helps tailor content acquisition strategies.
   
      • Understanding viewer interest through ratings and content diversity guides investment in high-demand content areas.
   
      • Analyzing content gaps reveals opportunities for regional and cultural expansion.
   
4. Implements an Analytical Workflow:

      The structured approach to database design, querying, and interpretation reflects an analytical mindset crucial for delivering measurable results.

# 👋 Let’s Connect!
I’d love to hear your feedback or collaborate on similar projects.

[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/snehal-alavekar-2985a7281)


