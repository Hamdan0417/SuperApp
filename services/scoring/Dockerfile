# syntax=docker/dockerfile:1.6
FROM python:3.12-slim AS base
WORKDIR /srv/app
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1
COPY pyproject.toml poetry.lock* ./
RUN pip install --upgrade pip && \
    if [ -f pyproject.toml ]; then pip install poetry && poetry install --no-interaction --no-root; fi

CMD ["python", "--version"]
