
# 🍽️ Pandas 실습 요약: 팁 데이터 분석 (Tips Dataset)

---

## 🧭 실습 개요

이번 실습에서는 `seaborn`의 **tips 데이터셋**을 활용하여  
`pandas`의 핵심 기능 (`groupby`, `pivot`, `melt`, 필터링 등)을 익혔습니다.  
각 단계는 실전 데이터 분석 흐름에 맞게 구성되어 있습니다.

---

## 1️⃣ 성별 / 요일별 평균 팁 계산 (`groupby` + `pivot`)

**목표:**  
성별(`sex`)과 요일(`day`)에 따른 팁(`tip`)의 평균을 구하고  
`pivot`을 활용해 표 형태로 보기 좋게 정리합니다.

```python
import seaborn as sns
import pandas as pd

tips = sns.load_dataset("tips")

# groupby + pivot
grouped = tips.groupby(["sex", "day"])["tip"].mean().reset_index()
pivot_table = grouped.pivot(index="sex", columns="day", values="tip")


**출력 예시**

```
day         Thur       Fri       Sat       Sun
sex                                            
Male     2.980333  2.693000  3.083898  3.220345
Female   2.575625  2.781111  2.801786  3.367222
```

**핵심 포인트**

* `groupby()`로 다중 그룹 집계
* `.reset_index()`로 피벗에 맞게 인덱스 초기화
* `.pivot()`으로 행·열 구조 재배열

---

## 2️⃣ 팁 비율 컬럼 추가 (`tip_percent`)

**목표:**
각 손님의 **팁 비율 = 팁 ÷ 총금액** 을 계산하여 새 컬럼 추가.

```python
df["tip_percent"] = df["tip"] / df["total_bill"]
```

**핵심 포인트**

* `df["새컬럼"] = 계산식` 형태로 바로 생성 가능
* 비율 데이터는 항상 0~1 사이 값이 되어야 함 (`.between(0, 1).all()`)

---

## 3️⃣ 팁 비율이 높은 고객 필터링 (`high_tippers`)

**목표:**
팁 비율이 **20% 이상**인 고객만 추출.

```python
high_tippers = df[df["tip_percent"] >= 0.2]
```

**핵심 포인트**

* 조건 필터링: `df[조건]`
* 비교 연산자는 브로드캐스팅되어 모든 행에 적용됨

---

## 4️⃣ 데이터 구조 변환 (`melt`)

**목표:**
`total_bill`과 `tip` 컬럼을 long-format으로 변환
(`size`는 유지 → `id_vars=['size']`)

```python
melted = pd.melt(
    tips,
    id_vars=['size'],
    value_vars=['total_bill', 'tip'],
    var_name='item',
    value_name='amount'
)
```

**출력 예시**

```
     size        item  amount
0       2  total_bill   16.99
1       3  total_bill   10.34
...
483     3         tip    5.92
```

**핵심 포인트**

* `melt()`는 wide → long 변환
* `id_vars`: 고정할 열
* `value_vars`: 녹일 열
* `var_name` / `value_name`: 새 열 이름 지정

---

## 5️⃣ 인원(size)별 평균 팁 비율 (`groupby`)

**목표:**
식사 인원(`size`)별 평균 팁 비율 계산.

```python
size_group = df.groupby("size")["tip_percent"].mean()
```

**출력 예시**

```
size
1    0.176429
2    0.165573
3    0.155457
4    0.160298
5    0.160256
6    0.146666
```

**핵심 포인트**

* `groupby("size")`로 그룹화
* `.mean()`으로 평균 계산
* 결과는 `pd.Series` 형태

---

## 6️⃣ 최고 팁 비율 고객 찾기 (`top_tipper`)

**목표:**
팁 비율(`tip_percent`)이 **최대값인 고객** 추출.

```python
top_tipper = df[df["tip_percent"] == df["tip_percent"].max()]
```

**출력 예시**

```
     total_bill   tip     sex smoker  day    time  size  tip_percent
67         3.07  1.00  Female     No  Sat  Dinner     1     0.325733
```

**핵심 포인트**

* `df["col"].max()` → 컬럼의 최댓값
* `df[df["col"] == max값]` → 조건에 맞는 행 선택
* 동률이 있을 경우 여러 행 반환 가능

---

## ✅ 전체 핵심 요약표

| 기능      | 사용 함수                                              | 설명                |
| ------- | -------------------------------------------------- | ----------------- |
| 그룹별 평균  | `groupby()` + `mean()`                             | 성별·요일별 평균 팁       |
| 피벗 변환   | `pivot()`                                          | 행·열 구조 재배열        |
| 비율 계산   | `/` 연산                                             | tip / total_bill  |
| 조건 필터링  | `df[조건]`                                           | 팁 비율 0.2 이상 고객 추출 |
| 형태 변환   | `melt()`                                           | wide → long 변환    |
| 그룹 평균   | `groupby("size")["tip_percent"].mean()`            | 인원별 평균 팁 비율       |
| 최댓값 필터링 | `df[df["tip_percent"] == df["tip_percent"].max()]` | 최고 팁 비율 고객        |

---

### 🎯 학습 포인트 정리

* `groupby`와 `pivot`은 **요약 및 구조화**의 핵심
* `melt`는 **데이터 재구성(long-format)** 에 필수
* 조건 필터링은 **데이터 추출의 기본**
* `groupby` 결과는 Series/DataFrame으로 반환됨
* 간결하고 의미 있는 코드로 데이터 통찰을 얻을 수 있음

