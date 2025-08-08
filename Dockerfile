FROM python:3.11-slim

# Create app dir
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8000

# Use gunicorn for production-style serving
CMD ["gunicorn", "-b", "0.0.0.0:80", "app:app", "--workers", "2", "--timeout", "30"]
