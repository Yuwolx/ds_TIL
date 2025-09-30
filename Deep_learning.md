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


## 6. Rag 구조

### RAG란?
- **Retrieval-Augmented Generation**
- LLM(대규모 언어모델)에 **검색 기반 외부 지식**을 결합하여 답변을 생성하는 방식
- 단순히 모델이 학습한 데이터(Pre-training)만 쓰는 것이 아니라, **실시간 지식**을 불러와 답변의 정확도를 높임  

---

## RAG의 필요성
- 모델은 훈련 시점까지의 데이터만 알고 있음 → 최신 정보, 특정 도메인 지식 부족
- 예: "2025년 최신 서울 지하철 요금은?" → 기존 LLM은 모를 수 있음  
- **RAG**는 외부 지식 DB(knowledge base)에서 관련 정보를 찾아 답변에 활용  

---

## 1) RAG의 4가지 분류

- **Prompt Engineering**: 단순히 프롬프트를 잘 짜서 모델이 답변하도록 함 (외부 지식 없음)
- **RAG**: 검색을 통해 외부 지식을 붙여 모델에게 제공 (외부 지식 ↑, 모델 수정 ↓)
- **Fine-Tuning**: 모델 자체를 학습 데이터로 다시 훈련 (모델 적응 ↑, 외부 지식 ↓)
- **Hybrid**: RAG와 Fine-Tuning을 결합한 방식 (지식+모델 적응 둘 다 ↑)

---

## 2) RAG의 동작 구조

1. **사용자 입력(Query)** → 모델로 전달  
2. **Retrieval Model**이 Query를 받아 Knowledge Base에서 **관련 문서 검색**  
3. 검색된 **관련 문서(relevant docs)**를 원래 Query와 결합 → LLM에 전달  
4. **LLM(Pre-trained)**이 Query + 검색된 문서를 바탕으로 **Response(답변)** 생성  
5. 사용자(User)에게 전달  

---

## RAG의 장점
- 최신 정보, 도메인 지식 반영 가능
- 모델 파라미터를 바꾸지 않고도 지식 확장
- 작은 모델로도 강력한 성능 발휘 가능 (외부 DB가 지식을 보완)

---

## RAG의 한계
- 검색 결과 품질에 따라 답변이 달라짐
- Retrieval 속도가 느리면 응답 지연
- Knowledge Base 관리 비용 발생

---

RAG는 **LLM+검색기**라고 생각하면 됨.  
LLM이 "머리(추론 능력)"라면, Retrieval은 "책이나 인터넷에서 자료 찾기" 역할.  
즉, **기억은 짧아도, 필요할 때 참고서 찾아와 답하는 방식**이라고 이해하면 쉬움.  
