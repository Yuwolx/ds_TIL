
# 📊 Pandas Cheatsheet

## 1. Data Selection & Filtering

```python
# Filter rows by condition
df[df["Sex"] == "male"]

# Multiple conditions
df[(df["Age"] > 10) & (df["Age"] < 20)]
```

➡ Conditions create a **Boolean Series** → only `True` rows are selected.

---

## 2. Counting & Size

```python
df.shape[0]                          # number of rows
df[df["Survived"] == 1].shape[0]     # survivors count
df["Sex"].value_counts()             # frequency by category
```

---

## 3. Grouping & Aggregation

```python
df.groupby("Sex")["Survived"].mean()     # survival rate by gender
df.groupby("Pclass")["Fare"].median()    # median fare by class
```

---

## 4. Creating New Columns

```python
# Using conditions
df["Age_Group"] = "Unknown"
df.loc[df["Age"] <= 10, "Age_Group"] = "Child"
df.loc[(df["Age"] >= 11) & (df["Age"] <= 19), "Age_Group"] = "Teen"

# Using apply()
def categorize(n):
    if n <= 10: return "Low"
    elif n <= 30: return "Medium"
    else: return "High"

df["PurchaseCategory"] = df["PurchaseHistory"].apply(categorize)
```

---

## 5. Missing Values

```python
df["Fare"].isna().sum()                       # check missing
df["Fare"] = df["Fare"].fillna(0)             # replace with 0
df["Age"] = df["Age"].fillna(df["Age"].median())  # replace with median
```

---

## 6. Descriptive Statistics

```python
df["Age"].describe()

q1 = df["Age"].quantile(0.25)
q3 = df["Age"].quantile(0.75)
iqr = q3 - q1
```

---

## 7. Correlation

```python
df[["Fare", "Age"]].corr()

import seaborn as sns
sns.heatmap(df[["Fare", "Age"]].corr(), annot=True)
```

---

## 8. Data Transformation

```python
# Wide → Long format
df_long = df.melt(id_vars="Region", var_name="Month", value_name="Car Usage Rate")

# Merge DataFrames
df_merged = pd.merge(df_purchase, df_satisfaction, on="CustomerID")
```

---

## 9. Data Types

```python
df["Age"].dtype        # single column dtype
df.dtypes              # all columns dtypes
```

---

## 10. Sampling

```python
df.sample(n=10)    # random 10 rows

import numpy as np
np.random.choice(df["Age"], size=30, replace=True)  # bootstrap sample
```

---

✅ **Workflow summary:**
Data selection → Aggregation → Handle missing values → Grouping/New columns → Descriptive stats → Correlation → Reshape/Merge → Sampling & Visualization

---

# 📌 Pandas (Continuation)

## Dropping Columns

* `df.drop(columns=['col1', 'col2'], axis=1, inplace=True)`

  * **`axis=1`** → specifies that columns (not rows) should be dropped.
  * **`inplace=True`** → modifies the original DataFrame instead of returning a new one.

---

## Creating Derived Features

```python
df['is_long'] = (df['Distance (km)'] >= 20).astype(int)
```

* Creates a new column `is_long`.
* Boolean condition (`True`/`False`) → converted into integers (`1`/`0`) with `.astype(int)`.

---

## Missing Values & Outlier Detection

* **Missing Values**

  ```python
  df.isna().sum()
  ```

  → Counts missing values per column.

* **IQR Outlier Detection**

  ```python
  q1 = df['col'].quantile(0.25)
  q3 = df['col'].quantile(0.75)
  iqr = q3 - q1
  low, high = q1 - 1.5*iqr, q3 + 1.5*iqr
  outliers = df[(df['col'] < low) | (df['col'] > high)]
  ```

  → Identifies rows outside the interquartile range.

---

## One-Hot Encoding

```python
encoded = pd.get_dummies(df, columns=['Category'], drop_first=False, dtype='int8')
```

* Converts categorical string columns into multiple binary (0/1) columns.
* Helps machine learning models by representing categories numerically **without implying order**.

