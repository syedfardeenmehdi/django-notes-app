
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app/backend

# Install system dependencies required by mysqlclient
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    pkg-config \
    default-libmysqlclient-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir mysqlclient

# Copy application source
COPY . .

EXPOSE 8000

CMD ["gunicorn", "notesapp.wsgi:application", "--bind", "0.0.0.0:8000"]
