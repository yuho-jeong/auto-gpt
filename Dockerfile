# 'dev' or 'release' container build
ARG BUILD_TYPE=dev

# Use an official Python base image from the Docker Hub
FROM python:3.10-slim AS autogpt-base

# Install browsers
RUN apt-get update && apt-get install -y \
    chromium-driver firefox-esr \
    ca-certificates

# Install utilities
RUN apt-get install -y curl jq wget git

RUN apt-get update && apt-get install -y \
    chromium-driver firefox-esr \
    ca-certificates \
    libglib2.0 libnss3 libgconf-2-4 libfontconfig1

# Set environment variables
ENV PIP_NO_CACHE_DIR=yes \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Install the required python packages globally
ENV PATH="$PATH:/root/.local/bin"
COPY requirements.txt .

# Set the entrypoint
ENTRYPOINT ["uvicorn", "--app-dir", "/app/slack", "app:app", "--host", "0.0.0.0", "--port", "30207", "--reload"]

# dev build -> include everything
FROM autogpt-base as autogpt-dev
RUN pip install --no-cache-dir -r requirements.txt
WORKDIR /app
ONBUILD COPY . ./

# release build -> include bare minimum
FROM autogpt-base as autogpt-release
RUN sed -i '/Items below this point will not be included in the Docker Image/,$d' requirements.txt && \
	pip install --no-cache-dir -r requirements.txt
WORKDIR /app
ONBUILD COPY autogpt/ ./autogpt
ONBUILD COPY scripts/ ./scripts
ONBUILD COPY plugins/ ./plugins
ONBUILD COPY slack/ ./slack

FROM autogpt-${BUILD_TYPE} AS auto-gpt
