# RAG(Project) 정리 - 시험 대비 요약


## PDF 기반 RAG

- **문서 로드**
  - `PyPDFDirectoryLoader` : 폴더 내의 PDF 파일을 불러옴
  - 출력 확인 : `len(docs)`, `docs[0].metadata`, `docs[0].page_content`

- **텍스트 분할**
  - `RecursiveCharacterTextSplitter(chunk_size=500, chunk_overlap=50)`
  - 긴 문서를 일정 크기 단위(청크)로 분할
  - `split_documents(docs)` → `splits` 생성
  - `chunk_overlap`으로 청크 사이 맥락 유지

- **임베딩 & 인덱싱**
  - `OpenAIEmbeddings()` : 텍스트 → 벡터(숫자) 변환
  - `FAISS.from_documents(splits, embeddings)` : 벡터DB에 저장
  - `retriever = vectorstore.as_retriever()` : 질의 시 관련 문서 검색 가능

- **QA 체인**
  - `PromptTemplate` : 문맥(context) + 질문(question) 합쳐서 LLM에 전달
  - `ChatOpenAI` : 답변 생성
  - `StrOutputParser` : 응답을 문자열로 정리
  - `rag_chain.invoke("질문")` : 최종 실행

---

## 뉴스기사 기반 RAG

- **문서 로드**
  - `WebBaseLoader` : 웹 URL에서 문서 불러오기
  - `bs4.SoupStrainer` : HTML 중 특정 태그(class)만 파싱
  - 네이버 뉴스 기사 → `newsct_article _article_body`, `media_end_head_title`
  - `docs = loader.load()`

- **텍스트 분할**
  - `RecursiveCharacterTextSplitter(chunk_size=1000, chunk_overlap=100)`
  - 뉴스 기사 길이에 맞춰 청크 생성
  - `split_documents(docs)` → `splits`

- **임베딩 & 인덱싱**
  - `OpenAIEmbeddings()` : 뉴스 기사 청크 임베딩
  - `FAISS.from_documents(splits, embeddings)` : 벡터 저장
  - `retriever = vectorstore.as_retriever()`

- **QA 체인**
  - `PromptTemplate` : 질문 + context
  - `ChatOpenAI` : 답변 생성
  - `rag_chain.invoke("뉴스 관련 질문")`

---


- **RAG 파이프라인 단계**
  1. 문서 로드 (PDF/웹)
  2. 텍스트 분할 (청크 생성)
  3. 임베딩 (텍스트 → 벡터)
  4. 인덱싱 (FAISS에 저장)
  5. 검색 (retriever로 관련 문서 찾기)
  6. QA 체인 (LLM이 답변 생성)

- **PDF vs 뉴스 차이**
  - PDF → `PyPDFDirectoryLoader`
  - 뉴스 → `WebBaseLoader + bs4.SoupStrainer`
  - 뉴스는 HTML 구조(class명) 직접 확인 필요

- **중요 매개변수**
  - `chunk_size` : 청크 최대 길이
  - `chunk_overlap` : 청크 사이 겹침 (문맥 유지)
  - 너무 크면 → 메모리 낭비, 너무 작으면 → 맥락 끊김

- **Retriever**
  - 사용자의 질문과 가장 유사한 문서 벡터 검색
  - 검색된 문서를 LLM에 넣어 답변 생성

- **PromptTemplate**
  - 단순히 질문만 넣는 게 아니라, 문서(context)와 함께 전달
  - LLM이 외부 지식을 참고해 더 정확한 답변 생성

- **LLM 응답**
  - `ChatOpenAI` : OpenAI 모델 사용
  - `StrOutputParser` : 응답을 문자열 형태로 변환

---

## 최종 요약

- RAG = **외부 문서 기반으로 LLM이 답변을 생성하는 방식**
- 핵심 순서 = **로드 → 분할 → 임베딩 → 인덱싱 → 검색 → QA**
- PDF와 뉴스 모두 같은 구조지만, **데이터 로더 차이**가 있음
- 시험에서 중요한 포인트:
  - 로더 종류 (PDF/웹)
  - 텍스트 분할기 역할과 매개변수
  - 임베딩 → 벡터DB → 검색 과정
  - QA 체인 구성 요소 (PromptTemplate, Retriever, LLM)
