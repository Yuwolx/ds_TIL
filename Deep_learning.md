# Deep Learning 정리

## 1. Machine Learning vs Deep Learning
### Machine Learning
- 사람이 직접 특징(Feature)을 추출하거나 설계해야 함  
- 알고리즘(SVM, Random Forest 등)을 통해 데이터를 학습  
- 특징 추출 과정에서 도메인 지식 필요  

### Deep Learning
- 데이터에서 특징 추출을 모델이 자동으로 수행  
- 다층 신경망(Neural Network) 구조 기반  
- 복잡한 패턴을 스스로 학습 가능  

**차이점 요약**  
- 머신러닝: 특징 설계 수작업  
- 딥러닝: 특징을 자동 학습  
- 데이터 양이 많고 복잡도가 높을수록 딥러닝이 더 효과적  

---

## 2. 딥러닝 모델 구조
- **노드(Node)**: 입력 값을 받아 가중치(Weight)를 곱하고, 활성화 함수를 거쳐 출력  
- **가중치(Weight)**: 연결의 중요도를 의미  
- **활성화 함수(Activation Function)**: 비선형 변환을 통해 복잡한 패턴 학습 가능  
- **출력(Output)**: 다음 층으로 전달, 최종적으로 예측 결과 생성  

---

## 3. 학습 방식
### 순전파 (Forward Propagation)
- 입력 데이터 → 입력층 → 은닉층 → 출력층  
- 각 층에서 가중치·입력 곱 + 활성화 함수 적용  

### 손실(Loss) 계산
- 예측 값과 실제 값의 차이를 측정  
- 예시:  
  - 회귀 → MSE  
  - 분류 → Cross-Entropy  

### 역전파 (Backpropagation)
- 손실 값을 기준으로 오차가 각 가중치에 미친 영향 계산  
- 가중치를 경사하강법(Gradient Descent)으로 업데이트  

---

## 4. 학습 관련 용어
- **Epoch**: 전체 학습 데이터셋을 모델에 한 번 모두 학습시키는 과정 (정주행 횟수)  
- **Batch**: 한 번 학습에 사용되는 데이터 묶음 크기  
- **Iteration**: 한 Epoch에서 Batch를 몇 번 학습했는지 의미  
  - Iteration = 전체 데이터 개수 / Batch 크기  

- **Train Set**: 모델 학습 데이터  
- **Validation Set**: 학습 과정 성능 평가 및 하이퍼파라미터 조정용 데이터  
- **Test Set**: 최종 성능 검증용 데이터  

---

## 5. 주요 신경망 구조
### RNN (Recurrent Neural Network)
- 순환 신경망  
- 이전 단계 출력을 다음 단계 입력으로 전달  
- 시계열 데이터, 자연어 처리, 음성 인식 등 순서가 중요한 데이터 처리에 적합  

### LSTM (Long Short Term Memory)
- RNN의 변형 모델  
- 장기 의존성 문제(Long-term dependency)를 해결  
- **셀 상태(Cell State)**와 **게이트 구조**(Input, Forget, Output Gate)를 이용해 정보 흐름을 제어  
- 중요한 정보는 장기간 기억, 불필요한 정보는 망각  
