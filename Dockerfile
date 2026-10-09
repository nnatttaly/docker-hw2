FROM python:3.14-slim
RUN apt-get update
RUN apt-get install -y build-essential
COPY app /app
WORKDIR /app
RUN pip install -r requirements.txt
RUN apt-get purge -y build-essential && apt-get autoremove -y
RUN rm -rf /var/lib/apt/lists/*
EXPOSE 8000
CMD ["python", "app.py"]
