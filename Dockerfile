FROM python:3.8-slim-buster
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY ./core .
COPY ./libreria .
COPY manage.py .
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt