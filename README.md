readme_ml_diabetes = """
<div align="center">

# 🩺 Machine Learning for Diabetes Assessment  
### 🔍 Predictive Modeling for Chronic Disease Detection

[![R](https://img.shields.io/badge/Built%20With-R-276DC3?logo=r&logoColor=white)](https://www.r-project.org/)  
📅 **Date**: May 15, 2025  👨‍💻 **Author**: Enock Bereka

</div>

---

## 🎯 Study Objectives

- ✅ Build predictive models to assess diabetes likelihood using clinical features.
- 🔬 Analyze variable importance and perform rigorous data cleaning.
- 🧠 Train and compare multiple machine learning classifiers.
- 📈 Evaluate models using metrics like Sensitivity, F1 Score, and AUC.
- 💾 Save the most performant model for deployment.

---

## 📦 Dataset Overview

- **Total observations**: 768
- **Features**: Pregnancies, Glucose, BloodPressure, SkinThickness, Insulin, BMI, DiabetesPedigreeFunction, Age, Outcome

Outcome is binary: **Yes** (has diabetes) / **No** (does not have diabetes)

---

## 🧹 Data Preprocessing

- Replaced impossible `0` values (e.g., in BloodPressure, Glucose) with **median imputation**.
- Removed uninformative feature: `BloodPressure`.
- Encoded outcome as factor (Yes/No).
- Addressed class imbalance by **undersampling** the majority class.

---

## 🔍 Feature Selection

- Applied `Boruta` algorithm for feature importance.
- **Top 7 features**: Glucose, BMI, SkinThickness, Insulin, DiabetesPedigreeFunction, Age, Pregnancies

---

## ⚙️ Machine Learning Models

| Model                  | Sensitivity | F1 Score | AUC      |
|------------------------|-------------|----------|----------|
| Logistic Regression    | 0.61        | 0.67     | 0.81     |
| Regularized Logistic   | 0.59        | 0.67     | 0.82     |
| Decision Trees         | 0.72        | 0.73     | 0.81     |
| Random Forest 🌲        | **0.78**    | **0.77** | **0.85** |
| XGBoost 🔥             | 0.78        | 0.76     | 0.84     |
| K-Nearest Neighbors ⭐  | 0.74        | 0.72     | 0.82     |
| Gradient Boosting      | 0.70        | 0.72     | 0.85     |
| Support Vector Machine | 0.57        | 0.65     | 0.84     |
| LDA                    | 0.57        | 0.65     | 0.82     |

🏆 **Best Model**: `KNN` selected based on balanced performance and interpretability.

---

## 📊 ROC Curve Performance

Each model’s ROC curve was plotted to visualize true-positive vs false-positive rates, with **KNN**, **Random Forest**, and **XGBoost** achieving the highest AUC values.

---

## 💡 Key Insights & Recommendations

- **Glucose**, **BMI**, and **Age** are top predictors of diabetes.
- **Early screening** based on these attributes can enable timely interventions.
- Undersampling addressed imbalance but future models could benefit from **SMOTE** or **ensemble techniques**.
- Integration into **clinical decision systems** or mobile health apps is encouraged.
- Future expansion: use of **real-time EHR data** and **longitudinal records**.

---

## 💾 Deployment

The final model (KNN) was saved as a `.rds` object:
```r
saveRDS(best_model, "model.rds")
