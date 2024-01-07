FROM python:3.8-slim-buster
ENV PYTHONUNBUFFERED=1
WORKDIR /django
COPY ./Docker/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .