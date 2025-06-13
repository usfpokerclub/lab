# # =============================================================================
# # MIT POKER BOTS - FLASK APPLICATION DOCKERFILE
# # =============================================================================
# # Multi-stage Dockerfile for Flask application with development optimizations
# # =============================================================================

# FROM python:3.7-bullseye as base

# # Set environment variables
# ENV PYTHONUNBUFFERED=1 \
#     PYTHONDONTWRITEBYTECODE=1 \
#     PIP_NO_CACHE_DIR=1 \
#     PIP_DISABLE_PIP_VERSION_CHECK=1

# # Install system dependencies
# RUN apt-get update && apt-get install -y \
#     gcc \
#     g++ \
#     make \
#     libpq-dev \
#     curl \
#     git \
#     && rm -rf /var/lib/apt/lists/*

# # Create app user
# RUN useradd --create-home --shell /bin/bash app

# # Set work directory
# WORKDIR /app

# # Install Python dependencies
# COPY requirements.txt .
# RUN pip install --no-cache-dir -r requirements.txt

# # Install additional development and monitoring tools
# RUN pip install --no-cache-dir \
#     flower \
#     redis \
#     psycopg2-binary \
#     python-dotenv

# # Copy application code
# COPY . .

# # Create necessary directories
# RUN mkdir -p logs && \
#     chown -R app:app /app

# # Switch to app user
# USER app

# # Expose port
# EXPOSE 5000

# # Fixed CMD - use Flask-Script command without Flask CLI arguments
# CMD ["python", "manage.py", "runserver"]

# =============================================================================
# MIT POKER BOTS - FLASK APPLICATION DOCKERFILE
# =============================================================================
# Multi-stage Dockerfile for Flask application following original repo patterns
# =============================================================================

FROM python:3.7-bullseye

# Set environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=1 \
    PIP_DISABLE_PIP_VERSION_CHECK=1

# Install system dependencies (including scons and boost as mentioned in README)
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    libpq-dev \
    curl \
    git \
    scons \
    libboost-all-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Copy requirements files first for better caching
COPY requirements.txt ./
COPY requirements-worker.txt ./

# Install base Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install worker-specific dependencies
RUN pip install --no-cache-dir -r requirements-worker.txt

# Copy application code
COPY . .

# Create necessary directories and set permissions
RUN mkdir -p logs

# Expose ports (Flask typically runs on 5000, but manage.py might use 5001)
EXPOSE 5000
EXPOSE 5001

# Default command - this will be overridden by docker-compose
CMD ["python", "manage.py", "runserver", "--host=0.0.0.0", "--port=5001"]