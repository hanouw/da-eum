# 1. 빌드 스테이지
FROM python:3.12-slim AS builder
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/
ENV UV_COMPILE_BYTECODE=1 UV_LINK_MODE=copy
WORKDIR /app

# 의존성 파일 복사 및 설치 (캐시 활용)
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev

# 전체 프로젝트 코드 복사 및 빌드
ADD . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

# 2. 실행 스테이지
FROM python:3.12-slim
WORKDIR /app

# 빌드 스테이지의 가상환경과 앱 복사
COPY --from=builder /app/.venv /app/.venv
COPY --from=builder /app/app /app/app

# 가상환경 바이너리 경로 환경 변수 추가
ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
