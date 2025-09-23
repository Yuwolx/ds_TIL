# 🤖 머신러닝 기초 정리

## 1. Confusion Matrix (혼동 행렬)

|           | 예측=0 | 예측=1 |
| --------- | ---- | ---- |
| 실제=0 (음성) | TN   | FP   |
| 실제=1 (양성) | FN   | TP   |

* **TP (True Positive)**: 실제 1, 예측 1 (정탐)
* **TN (True Negative)**: 실제 0, 예측 0 (정탐)
* **FP (False Positive)**: 실제 0인데 1로 예측 → 오탐
* **FN (False Negative)**: 실제 1인데 0으로 예측 → 미탐

---

## 2. 성능 지표

### 🔹 정밀도 (Precision)

* 정의: 모델이 Positive라고 예측한 것 중 실제로 Positive인 비율
* 해석: "내가 맞췄다고 한 것 중에서 진짜 맞은 게 얼마나 되나?"
* 공식:

  $$
  Precision = \frac{TP}{TP + FP}
  $$

---

### 🔹 재현율 (Recall)

* 정의: 실제 Positive 중에서 모델이 Positive라고 맞춘 비율
* 해석: "실제 맞는 것 중에 내가 얼마나 잘 찾아냈나?"
* 공식:

  $$
  Recall = \frac{TP}{TP + FN}
  $$

---

### 🔹 F1-score

* 정의: 정밀도와 재현율의 조화 평균
* 특징: Precision과 Recall 중 하나라도 낮으면 F1도 낮아짐
* 공식:

  $$
  F1 = 2 \cdot \frac{Precision \times Recall}{Precision + Recall}
  $$
* 의미: 두 지표가 균형 있게 높아야 좋은 점수

---

## 3. 클래스별 성능 지표

* Precision, Recall, F1은 **양성 클래스(Positive class)** 기준으로 정의됨.
* 이진 분류에서는 0과 1 모두 중요할 수 있음 →
  그래서 0을 Positive로 두고 계산한 경우, 1을 Positive로 두고 계산한 경우를 **각각 따로** 확인해야 함.
* `classification_report`는 이를 자동으로 클래스별로 보여줌.

---

## 4. 인코딩 방법

### 🔹 라벨 인코딩 (Label Encoding)

* 각 카테고리를 정수(0, 1, 2, …)로 변환
* 단점: 모델이 숫자 크기(순서)를 인위적으로 해석할 수 있음

### 🔹 원-핫 인코딩 (One-Hot Encoding)

* 각 카테고리를 새로운 열로 만들고 0/1로 표현
* 예: `["A", "B", "C"]` → `A=100, B=010, C=001`
* 장점: 순서 개념이 사라져 모델이 오해하지 않고 학습 가능
* 그래서 범주형 변수 처리 시 일반적으로 원-핫 인코딩을 선호

---

## 5. 요약 한 줄 정리

* **Precision**: 맞췄다고 한 것 중 실제로 맞은 비율
* **Recall**: 실제 맞는 것 중에서 내가 맞춘 비율
* **F1-score**: Precision과 Recall의 균형을 본 지표
* **Confusion Matrix**: TP, TN, FP, FN으로 성능 해석
* **라벨 인코딩**: 단순 정수 변환, 순서 오해 가능
* **원-핫 인코딩**: 범주형 변수를 0/1 벡터로 변환, 안전함

---