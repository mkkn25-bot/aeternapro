FROM python:3.9-slim

WORKDIR /app

# Create a non-root user
RUN adduser --disabled-password --gecos '' appuser

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Change ownership of the app directory to the new user
RUN chown -R appuser:appuser /app

# Switch to the non-root user
USER appuser

CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
