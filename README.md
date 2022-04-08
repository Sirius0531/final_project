![image](https://github.com/Sirius0531/final_project/blob/main/Resources/Images/pj_banner.jpg)
# Data Scientist Salary Analysis with Machine Learning
Project Description [PDF](https://github.com/Sirius0531/final_project/blob/main/Archive/2nd%20Segment%20Project%20Deliverable/Deliverable2_Storyboard_PDF.pdf) &
Project [Dashboard](https://sirius0531.github.io/final_project/Website/index.html) &
Presentation [Flash Cards](https://docs.google.com/presentation/d/1RYqxEM__TevdDOhwg8GO3oerPjs3XSrG1k4ISLAIga0/edit?usp=sharing)
Presentation Practice [Video](https://nike.box.com/s/9od6gj7fqs2sihwmqyr18qbqhgr7wf2l) 

## Topic:
Predict the average salary of jobs in the data industry based on different variables using a regression model. We wanted to see how factors such as company, location, and experience affect the expected salary.

### The reason the topic was selected
We selected this topic because it was one that was of interest to all of us including our classmates. As we graduate from this course and enter the job market we have a frame of reference when negotiating compensation offers.
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
<img src="https://raw.githubusercontent.com/Sirius0531/final_project/main/Resources/Images/Salary_Experience_distribution.jpg" width="800" >
2.  Dropping columns in Data Frame, such as race, bonus, stock, other details, and tags, which are not used in the analysis. 

- Filter out foreign locations
- Split "location" to two columns State & City
- Keep: (total yearly compensation < 500,000)
- Keep: (total yearly compensation > 30,000)
- Keep: (years of experience < 21)
- drop: (years of experience == 0  &   total yearly compensation > 250,000)
- drop: (years of experience > 5    &   total yearly compensation < 45,000)

4.  Split the location into States, Cities, and Countries.
5.  Once the data was clean we did visualizations of the data, and observe the correlation between each variable and total yearly compensation. 

[Dashboard](https://public.tableau.com/app/profile/sirius.liao/viz/SalaryAnalysis-Storyboard/DataScientistSalaryAnalysis#1) of our initial visualizations.
![Data Scientist Salary Analysis ](https://user-images.githubusercontent.com/92349969/161686283-2f7b32a7-9951-4d0d-a480-6c02c3a64637.png)
![Data Scientist Salary Analysis  (1)](https://user-images.githubusercontent.com/92349969/161686379-ca225305-5e04-4b10-b0c8-94a7334757e8.png)

5. Use python and pandas to clean the dataset, filtering on data industry-specific jobs in the USA and One-Hotencoder the object columns. 
6. Upload the cleaned dataset to the S3 bucket on AWS. Using Pyspar to connect AWS and PostgreSQL to store and analysis the data.
![image](https://user-images.githubusercontent.com/92349969/160261413-f58f0815-c402-407f-8edc-00913896e6cb.png)

### Database and ERD
<img src="https://github.com/Sirius0531/final_project/blob/main/Resources/Images/ERD.PNG" width="800" >

## Description of the analysis phase of the project

### Machine Learning Model Selection
Once the data was clean we did visualizations of the data to decide which models may lend themselves better to the data 
- We initially decided upon a linear model because what we were trying to find was a correlation rather than a classification
- Once saw the results of the simple linear regression model we knew we would need to explore a more sophisticated approach. Reasearching the power of decision trees, we went with the Random Forest Regressor (RFR) for the next approach.

###  Model Selection
Our data cleaning process began by filtering for "Data Scientist" in our data set, which left with about 2500 data entries.
Data exploration initially sought to define the target and feature variables. Our target feature was the self-reported total yearly compensation. Our focused features included years of experience, location, company size, and gender, and all columns not realated to these features were eliminated.

LinearRegression:
We began by examining a multiple linear regression model. Results from our data indicated that we might need a more sophisticated model.

<img src="https://user-images.githubusercontent.com/92349969/161686915-f743cbab-1963-41e7-bc69-cb0b84c6b590.png" width="600" >

Random Forest Regressor:
Harnessing the power of decision trees, we then examined the random forest regressor. This allowed us to increase predictive accuracy and control potential over-fitting. The ability to manipulate the number of estimators allowed us to tune the model for more accuracy. 

<img src="https://user-images.githubusercontent.com/92349969/161687082-b1af1b9b-d244-4f85-a0b7-9b96d0591f22.png" width="600" >

Neural networks:
Still, we wondered if there was another model that might work better for our data. We briefly explored a neural network, but while this model was subject to overfitting given our smaller sample size, it actually did not perform better than the other models.

<img src="https://user-images.githubusercontent.com/92349969/161687356-1e9a8e09-1dd2-4d20-b654-4ef202e18493.png" width="600" >
<img src="https://user-images.githubusercontent.com/92349969/161687377-f9410ac0-8426-438f-be3f-4fc3dd39df82.png" width="600" >


### Optimizing the Machine Learning Models
-  The RFR gave us a much better baseline of 57% accuracy. After some tuning of the the number of estimators this model utilized, we found our best results with 100 estimators producing an accuracy score of 61%. Our models were serialized with joblib to explore future training and predictions.
- To see if we could improve the model and employ skills learned in class we briefly explored a neural network, including many attempts to inflate neurons in hidden layers. While this model was already subject to overfitting given our smaller sample size, it actually did not perform better than the other models anyway, returning a MAPE value of 27.0.
- After some research about its performance compared to other regressors, we wanted to try utilizing extreme gradient boosting (XGBoost). This ensemble model allowed new trees to be added after other trees have learned, therefore minimizing the loss (an improvement on the RFR approach). This model ultimately proved the best, with predictive accuracy above 65% and a lower mean absolute percentage error (MAPE) at .1862.
- Side by side comparisions of each of these models revealed a potential to combine their individual predicitions by taking a simple mean of our tested models' predicted salaries. After trying different combinations, the mean of the Random Forest Regressor and XGBoost Regressor was able to reduce the MAPE to .1779. This final mean of the two models is what we used in our forecast simulation.

<img src="https://raw.githubusercontent.com/Sirius0531/final_project/bowman_segment1/final_website/MeanPredict1.png" >

## Recommendation for future analysis
Due to the time contrain and the limitation of the dataset, for future Analysis we would recommend finding data from more sources such as: 
- Have data that includes job description or posting
- Incolude a broader range of job titles
- Operate live web scraping to get more live data
- Utilize the “tag” or keyword we had in our data

 ## Technologies, languages, tools
 Anaconda, Github, Python, Postgres, AWS, Visual Studio, Jupyter Notebook, Pandas, scikit-learn, Tableau, Slack, Zoom
