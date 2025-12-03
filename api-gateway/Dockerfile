# Base image: Python 3.11 slim
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install system dependencies required for building Python packages
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        && rm -rf /var/lib/apt/lists/*

# Copy Poetry files first (for caching)
COPY pyproject.toml poetry.lock* /app/

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install Python dependencies via Poetry
RUN poetry config virtualenvs.create false \
    && poetry install --only main --no-interaction --no-ansi

# Copy FastAPI code
COPY api_gateway.py /app/api_gateway.py

# Expose FastAPI port
EXPOSE 8000

# Run FastAPI
CMD ["uvicorn", "api_gateway:app", "--host", "0.0.0.0", "--port", "8000"]

