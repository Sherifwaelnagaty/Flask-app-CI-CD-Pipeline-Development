FROM python:3.12.4-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN pip install --upgrade six

EXPOSE 5000

COPY . .

CMD [ "python", "-m" , "flask", "run","--host","0.0.0.0"]
