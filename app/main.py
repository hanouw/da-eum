from fastapi import FastAPI
from fastapi.responses import HTMLResponse

from app.api.v1.router import api_router

APP_NAME = "da-eum API"
APP_VERSION = "0.1.0"
API_V1_PREFIX = "/api/v1"


def create_app() -> FastAPI:
    app = FastAPI(
        title=APP_NAME,
        version=APP_VERSION,
        description="da-eum FastAPI prototype.",
    )

    app.include_router(api_router, prefix=API_V1_PREFIX)

    @app.get("/", response_class=HTMLResponse, tags=["root"])
    async def root() -> HTMLResponse:
        with open("app/templates/index.html", encoding="utf-8") as f:
            return HTMLResponse(content=f.read())

    @app.get("/health", tags=["health"])
    async def health_check() -> dict[str, str]:
        return {"status": "ok", "service": APP_NAME}

    return app


app = create_app()
