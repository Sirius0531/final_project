![image](https://github.com/Sirius0531/final_project/blob/main/Resources/Images/pj_banner.jpg)
# Data Scientist Salary Analysis with Machine Learning
Project Description [PDF](https://github.com/Sirius0531/final_project/blob/main/2nd%20Segment%20Project%20Deliverable/Deliverable2_Storyboard_PDF.pdf) &
Project [Dashboard](https://sirius0531.github.io/final_project/final_website/index.html) &
Presentation [Slides](https://docs.google.com/presentation/d/1RYqxEM__TevdDOhwg8GO3oerPjs3XSrG1k4ISLAIga0/edit?usp=sharing)

## Topic:
Predicting the average salary of jobs in the data industry based on different variables using a linear regression model. We wanted to see how factors such as company, location, and experience affect the expected salary.

### The reason the topic was selected
We selected this topic because it was one that was of interest to all of us including our classmates. As we graduate from this course and enter the job market we have a frame of reference when negotiating offers.
### Questions the team hopes to answer with the data
Our goal throughout this analysis was to better educate us on the salary levels of different data-related jobs. We wanted to see how do the different factors, such as:
- Location
- Years of experience
- Gender
- Company

affect the anticipated salary.


## Description of the source of data:

JACK OGOZALY. (November 2021). 
Kaggle: Salary and more-Data Scientist, Analyst, Engineer, 
Retrieved 3/16/2022 from https://www.kaggle.com/jackogozaly/data-science-and-stem-salaries.

This dataset has 62,000 salary records from top companies. It contains information such as company, location, education level, compensation (base salary, bonus, stock grants), race, and other details. During our analysis, we hoped this dataset would help us answer the question of how do different factors such as location, years of experience, gender, and company affect the anticipated salary.

**Limitations to Dataset**
- Accuracy of the data because it was self-reported by humans
- Data did not include job descriptions, and all jobs were the same title
- There were several imbalances in the dataset such as company size, location, years of experience
- Total Yearly Compensation means different things to different people when self-reporting (are stock options included, benefits packages, etc)

## Description of the data exploration phase of the project

### Data Cleaning and Analysis
1. We use boxplots to locate the outliers in [total salary](https://raw.githubusercontent.com/Sirius0531/final_project/main/2nd%20Segment%20Project%20Deliverable/Data/outlier_totalyearlycompensation.PNG) and [Year of experience](https://github.com/Sirius0531/final_project/blob/main/2nd%20Segment%20Project%20Deliverable/Data/outlier_yearofexperence.PNG), remove in the dataset.
2.  Dropping columns in Data Frame, such as race, bonus, stock, other details, and tags, which are not used in the analysis. 
3.  Split the location into States, Cities, and Countries.
4.  Once the data was clean we did visualizations of the data, and observe the correlation between each variable and total yearly compensation. 
[Dashboard](https://public.tableau.com/app/profile/sirius.liao/viz/SalaryAnalysis-Storyboard/DataScientistSalaryAnalysis#1) of our initial visualizations.
5. Use python and pandas to clean the dataset, filtering on data industry-specific jobs in the USA and One-Hotencoder the object columns. 
6. Upload the cleaned dataset to the S3 bucket on AWS. Using Pyspar to connect AWS and PostgreSQL to store and analysis the data.
![image](https://user-images.githubusercontent.com/92349969/160261413-f58f0815-c402-407f-8edc-00913896e6cb.png)

### Database and ERD
<img src="https://raw.githubusercontent.com/Sirius0531/final_project/main/2nd%20Segment%20Project%20Deliverable/ERD.PNG" width="800" >

## Description of the analysis phase of the project

### Machine Learning Model Selection
Once the data was clean we did visualizations of the data to decide which models may lend themselves better to the data 
- We initially decided upon a linear model because what we were trying to find was a correlation rather than a classification
- Once we tried to linear regression model we decided to explore and build upon it with the Random Forest Regressor
- To see if we could improve the model and employ skills learned in class we also tested with a Neural Network
- SciKitLearn is the ML library. We are doing multiple Linear Regression Models utilizing different variables from our dataset. We are also testing adding the Random Forest Classifier to our model as well. We will also use the Stats Model Library to evaluate the accuracy of our model.
- XGboost

## Optimize the Machine Learning Models


## Dashboard Walkthrough   (need to add screenshot once the dashborad finished)
**Introduction**
A brief block explains the purpose of this analysis:
**Prefered skills by company and job title**
An interactive dashboard was created where users can choose variables from a drop-down and see visualizations created with Tableau. 

**External Factors for Salary Differences**

**Internal Factors for Salary Differences**

**Result of analysis**


## Recommendation for future analysis
### Data collection form
### Included job discription


## Meet Our Team
