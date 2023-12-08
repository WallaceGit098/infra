FROM python:3

WORKDIR /app

COPY requirements.txt .

COPY app.py .

RUN pip install -r requirements.txt 

CMD [ "flask", "run", "-h", "0.0.0.0", "-p", "5000" ]