# Base image: Python 3.11 slim (lightweight, secure)
FROM python:3.11-slim

# System dependencies for numpy and scientific packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    gfortran \
    libopenblas-dev \
    liblapack-dev \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy requirements (pyproject + lock file)
COPY pyproject.toml poetry.lock* /app/

# Install Poetry
RUN pip install --no-cache-dir poetry

# Install dependencies (no venv, straight into system env)
RUN poetry config virtualenvs.create false \
    && poetry install --only main --no-interaction --no-ansi

# Copy application code
COPY model.py /app/model.py

# Expose port for KServe
EXPOSE 8080

# Run the model server
CMD ["poetry","run","python", "model.py"]
