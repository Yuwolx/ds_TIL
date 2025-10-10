
# 🧠 Python · Numpy · Pandas 기본 문법 종합 정리

---

## 🟩 1. Python 기본 문법

### 📌 수치형 다루기 (abs, round, pow, math.isclose)
파이썬에서 숫자 계산을 다룰 때 자주 쓰이는 기본 내장함수입니다.
```python
a = -3.14159
a_abs = abs(a)                     # 절댓값 → 3.14159
a_rounded = round(a)               # 반올림 → -3
a_squared = a ** 2                 # 제곱 → 9.869587728099999

import math
is_close_to_pi = math.isclose(abs(a), math.pi, rel_tol=1e-5)  # π와 거의 같은지 비교
```

---

### 📌 문자열 다루기 (endswith, isdigit, try-except)

문자열의 끝을 확인하거나 숫자 변환 가능 여부를 판별할 때 사용합니다.

```python
s = "Hello!"
ends_with_exclamation = s.endswith("!")   # True

# 숫자로 변환 가능한지 확인
try:
    float(s)
    is_convertible = True
except ValueError:
    is_convertible = False
```

---

### 📌 리스트 (List) 다루기

리스트는 변경 가능한(mutable) 자료형입니다.

```python
l = [1, 2, 3, 4]
l.remove(3)            # 값 3 제거 (첫 번째 등장만)
l.insert(2, 3)         # 2번 인덱스에 3 삽입
reversed_l = l[::-1]   # 새 리스트로 뒤집기
l.reverse()            # 원본 자체를 뒤집기
l.clear()              # 모든 원소 제거
```

---

### 📌 튜플 (Tuple)

튜플은 불변(immutable)한 리스트로, 주로 읽기 전용 데이터에 사용됩니다.

```python
t = (1, 2, 3, 4)
index_3 = t.index(3)   # 3의 인덱스 → 2
```

---

### 📌 집합 (Set)

중복 없는 원소 집합. 교집합, 합집합 연산이 자주 쓰입니다.

```python
s = {1, 2, 3, 4}
s.remove(3)            # 값 3 제거 (없으면 KeyError)
s.discard(3)           # 값 3 제거 (없으면 무시)
s2 = {3, 4, 5, 6}
intersection = s & s2  # 교집합 {4}
```

---

### 📌 딕셔너리 (Dictionary)

Key-Value 쌍의 자료구조. JSON과 유사한 구조입니다.

```python
d = {1: "apple", 2: "banana", 3: "cheese"}

keys = list(d.keys())          # 키 목록 → [1, 2, 3]
value_4 = d.get(4)             # 없는 key 조회 → None
d2 = {4: "dragonfruit"}
merged = d | d2                # 딕셔너리 병합 (Python 3.9 이상)
```

---

### 📌 문자열 속 숫자 합계 구하기

문자열 안의 숫자만 골라 합산하는 예시입니다.

```python
def sum_of_digits_in_string(s):
    total = 0
    for ch in s:
        if ch.isdigit():
            total += int(ch)
    return total

sum_of_digits_in_string("a1b2c3")  # → 6
```

---

## 🟦 2. 클래스 (OOP)

클래스는 데이터(속성)와 행동(메서드)을 함께 묶어 표현합니다.

```python
class Student:
    def __init__(self, name, korean, english, math):
        self.name = name
        self.korean = korean
        self.english = english
        self.math = math

    def get_total(self):
        return self.korean + self.english + self.math

    def get_average(self):
        return self.get_total() / 3

# 평균이 75 이상이면 합격
def check_pass(student):
    return "합격" if student.get_average() >= 75 else "불합격"

# 여러 학생 중 합격자와 우수자 구분
def analyze_students(students, threshold):
    passed = [s.name for s in students if s.get_average() >= 75]
    excellent = [s.name for s in students if s.get_total() >= threshold]
    return passed, excellent
```

🟢 핵심 포인트:

* `__init__`: 생성자, 객체 속성 초기화
* `self`: 인스턴스 자신을 가리킴
* `.get_total()`, `.get_average()`: 객체 메서드 호출 방식

---

## 🟨 3. Numpy 기본 문법

과학계산용 배열 라이브러리로, 다차원 데이터 연산에 강력합니다.

```python
import numpy as np

# 3x3 단위행렬 (Diagonal이 1)
x = np.identity(3)

# 3x3 표준정규분포 난수 행렬
y = np.random.randn(3, 3)

# 특정 원소 수정
x[0, 2] = 1

# 행렬곱 (matrix multiplication)
z = x @ y

# 자료형 변환
x_bool = x.astype(bool)         # True/False 형태로 변환
x_int = x.astype(int)           # 정수형 변환
x_float = x.astype(float) * 1.1 # 실수형 변환 및 곱셈

# 벡터 및 반복 행렬 생성
v = np.array([1, 2, 3])
V = np.tile(v, (3, 1))          # 같은 행 3개로 복제
V_vector = V.flatten()          # 1차원 벡터로 변환

# 균등 간격으로 0~2π 배열 생성 + sin 계산
theta = np.linspace(0, 2 * np.pi, 100)
sin_theta = np.sin(theta)
```

🟢 핵심 포인트:

* `np.identity(n)` : n×n 단위행렬
* `np.random.randn()` : 표준정규분포 난수
* `@` : 행렬 곱셈 연산자
* `.astype()` : 데이터형 변환
* `np.tile()` : 배열 반복 복제
* `.flatten()` : 다차원 → 1차원 변환
* `np.linspace()` : 균등한 간격의 수열 생성

---

## 🟧 4. Pandas DataFrame 생성

표 형태의 데이터를 다루는 데 특화된 라이브러리입니다.

```python
import pandas as pd
import numpy as np

# 기준 DataFrame
df = pd.DataFrame({
    "Name": ["Alice", "Bob", "Charlie"],
    "Age": [25, 30, 35],
    "Score": [85.5, 90.3, 78.9]
})

# 1️⃣ List[Dict] 기반 생성
df_1 = pd.DataFrame([
    {"Name": "Alice", "Age": 25, "Score": 85.5},
    {"Name": "Bob", "Age": 30, "Score": 90.3},
    {"Name": "Charlie", "Age": 35, "Score": 78.9}
])

# 2️⃣ List[List] 기반 생성
data = [
    ["Alice", 25, 85.5],
    ["Bob", 30, 90.3],
    ["Charlie", 35, 78.9]
]
columns = ["Name", "Age", "Score"]
df_2 = pd.DataFrame(data, columns=columns)

# 3️⃣ numpy.ndarray 기반 생성
names = ["Alice", "Bob", "Charlie"]
nums = np.array([
    [25, 85.5],
    [30, 90.3],
    [35, 78.9]
])
df_3 = pd.DataFrame(nums, columns=["Age", "Score"])
df_3["Age"] = df_3["Age"].astype(int)
df_3.insert(0, "Name", names)
```

🟢 핵심 포인트:

* `pd.DataFrame()` 은 다양한 구조 입력을 허용 (list, dict, numpy array 등)
* `columns` 인자로 컬럼 이름 지정
* `insert(0, "Name", names)` : 특정 위치(0)에 컬럼 추가
* `.astype()` : 자료형 맞추기 (`float → int` 등)

---

## ✅ 종합 요약

| 분류     | 주요 함수 / 메서드                                            | 설명                 |                  |
| ------ | ------------------------------------------------------ | ------------------ | ---------------- |
| 수치형    | `abs()`, `round()`, `math.isclose()`                   | 절댓값, 반올림, 근사 비교    |                  |
| 문자열    | `endswith()`, `.isdigit()`                             | 문자열 끝 검사, 숫자 여부 확인 |                  |
| 리스트    | `remove()`, `insert()`, `clear()`                      | 값 제거, 삽입, 전체 초기화   |                  |
| 집합     | `&`, `                                                 | `, `discard()`     | 교집합, 합집합, 안전한 제거 |
| 딕셔너리   | `.get()`, `.keys()`, `                                 | `                  | 안전한 접근, 병합       |
| 클래스    | `__init__`, `self`, 메서드                                | 객체지향 구조 익히기        |                  |
| Numpy  | `np.identity()`, `np.random.randn()`, `@`, `.astype()` | 배열 계산 핵심           |                  |
| Pandas | `pd.DataFrame()`, `.insert()`, `.astype()`             | 표형 데이터 생성 및 관리     |                  |



