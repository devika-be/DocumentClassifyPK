FROM python:3.9-slim

# Install dependencies
RUN apt-get update && apt-get install -y poppler-utils tesseract-ocr \
    && pip install streamlit pdf2image pytesseract Pillow fuzzywuzzy python-Levenshtein

# Copy app to container
WORKDIR /app
COPY . /app

# Run the Streamlit app
CMD ["streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]
