FROM python:3.12-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app
COPY . .
RUN uv lock && uv sync --locked --no-cache
ENV PATH="/app/.venv/bin:${PATH}"
EXPOSE 50051
CMD [ "uv", "run", "main.py" ]
