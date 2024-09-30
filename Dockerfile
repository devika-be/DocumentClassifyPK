# Use a base image with Python
FROM python:3.11-slim

# Install system-level dependencies: poppler-utils and tesseract-ocr
RUN apt-get update && apt-get install -y poppler-utils tesseract-ocr && \
    rm -rf /var/lib/apt/lists/*  # Clean up apt cache to reduce image size

# Set the working directory in the container
WORKDIR /app

# Copy your project files into the container
COPY . .

# Install Python dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Specify the command to run your Python application
CMD ["python", "app.py"]
