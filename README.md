# da-eum

시니어 문화/체육 바우처 사각지대 예측 및 예산 최적 할당 AI API 프로토타입입니다.

현재 단계에서는 공모전 프로젝트의 가장 큰 FastAPI 기틀만 잡아둡니다. 실제 데이터 처리, 모델링, 예측 API, 예산 최적화 API는 아직 구현하지 않고 TODO로 남깁니다.

## Run

```bash
uvicorn app.main:app --reload
```

브라우저에서 API 문서를 확인하려면 서버 실행 후 아래 주소로 접속합니다.

- Swagger UI: `http://127.0.0.1:8000/docs`
- ReDoc: `http://127.0.0.1:8000/redoc`

## Current API

- `GET /health`: 서비스 상태 확인

## Project Structure

```text
app/
  __init__.py
  main.py
  api/
    __init__.py
    v1/
      __init__.py
      router.py
ai-record/
AGENT.md
CORE.md
README.md
requirements.txt
```

## Folder and File Guide

- `app/`: FastAPI 애플리케이션 본문입니다.
- `app/main.py`: FastAPI 앱을 생성하고 전역 라우터와 헬스체크를 등록하는 진입점입니다.
- `app/api/`: 추후 API 버전과 라우터를 확장할 위치입니다.
- `app/api/v1/router.py`: v1 API 라우터 자리입니다. 현재는 도메인 엔드포인트를 연결하지 않습니다.
- `ai-record/`: 중요한 코드 수정 및 설계 변경 로그를 날짜별로 기록하는 폴더입니다.
- `AGENT.md`: 프로젝트 전용 AI 개발 가이드라인입니다.
- `CORE.md`: 프로젝트의 중심 설계, 모델링 방향, 핵심 의사결정을 정리하는 문서입니다.
- `requirements.txt`: Python 패키지 의존성 목록입니다.

## TODO

- 공공데이터 수집 및 전처리 구조 설계
- 사각지대 지수 산출 방식 정의
- 예측 API 엔드포인트 설계
- 예산 최적 할당 API 엔드포인트 설계
- XAI 설명 지표 설계
- 대시보드 연동 방식 설계
