**Diabetes Prognosis and Diagnosis**

📌 Project Summary

This project focuses on building a robust and interpretable machine learning pipeline for predicting the likelihood of diabetes in patients using clinical and diagnostic data. By combining statistical analysis, machine learning algorithms, and data visualization, the project aims to support healthcare professionals in making informed, data-driven decisions.

**🎯 Objectives**
Develop predictive models for diabetes classification.
Analyze key risk factors contributing to diabetes onset.
Compare and evaluate machine learning models for accuracy, reliability, and interpretability.
Create reproducible documentation and visual insights using R Markdown.
Integrate the best model in a shiny dashboard to make real world screening of Diabetes

**🛠️ Tools & Technologies**
R	Main programming language
RStudio	IDE for development and analysis
R Markdown (.Rmd)	Dynamic documentation
Packages:	
caret	Model training and evaluation
randomForest	Random Forest algorithm
e1071	Support Vector Machine (SVM)
ggplot2	Data visualization
pROC	ROC analysis and AUC metrics
dplyr, tidyr	Data manipulation

**🧬 Dataset**
The dataset used in this analysis is derived from anonymized patient health records. It includes the following features:
Pregnancies
Glucose
BloodPressure
SkinThickness
Insulin
BMI
DiabetesPedigreeFunction
Age
Outcome (binary: 0 = non-diabetic, 1 = diabetic)
Note: This is similar to the popular Pima Indians Diabetes Dataset used in medical ML research.

**🔍 Exploratory Data Analysis (EDA)**
Before modeling, a thorough exploratory data analysis was conducted to:
Visualize feature distributions
Detect and handle missing values (e.g., zeroes in physiological measurements)
Identify class imbalance
Analyze feature correlations
Feature Importance Analysis

**🤖 Machine Learning Models Used**
The following supervised learning models were implemented and evaluated:
Logistic Regression
Decision Tree Classifier
Random Forest Classifier
Support Vector Machine (SVM)
Gradient Boosting Machines
Linear Discriminant Analysis
K Nearest Neighbors
Each model was trained using cross-validation and tested on a testData to ensure generalizability.

**📊 Model Evaluation Metrics**
Accuracy
Precision
Recall (Sensitivity)
F1 Score
Area Under the ROC Curve (AUC)
ROC curves and confusion matrices were used to visually assess classifier performance.

**📈 Results & Insights**
Seven machine learning models were implemented and evaluated:
1. **Logistic Regression** — Sensitivity: 77.92%
2. **Decision Tree** — Sensitivity: 72.73%
3. **Random Forest** — Sensitivity: 77.27%
4. **Support Vector Machine (SVM)** — Sensitivity: **78.57%** ✅ Highest
5. **K-Nearest Neighbors (KNN)** — Sensitivity: 74.03%
6. **Naive Bayes** — Sensitivity: 76.62%
7. **Gradient Boosting Machine (GBM)** — Sensitivity: 76.62%

- **KNN** performed best, achieving the highest accuracy.

**📚 Folder Structure**
Diabetes-Prognosis-and-Diagnosis/
├── Machine Learning for Diabetes Assessment.Rmd
├── README.md
├── data/               # Raw or cleaned datasets
├── plots/              # Output graphs and charts
└── models/             # Saved model objects (optional)

**📜 License**
This project is licensed under the MIT License. See the LICENSE file for more details.

**🙌 Acknowledgments**
The dataset is adapted from Machine Learning Repository.

Special thanks to the open-source R community for developing powerful packages that make data science accessible and reproducible.
