FROM python:3.8-slim-buster
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY . .
RUN pip install --no-cache-dir -r requirements.txt
