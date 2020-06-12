From python:3.7-alpine
WORKDIR /code
ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . .
CMD ["flask","run"]
From ubuntu:18.04
RUN apt-get update && apt-get install -y redis-server && apt-get clean
EXPOSE 6379
CMD ["redis-server","--protected-mode no"]
