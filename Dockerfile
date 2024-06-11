FROM python:3.12.4-alpine

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

RUN pip install --upgrade six

ENV FLASK_ENV=development

COPY . .

CMD [ "python", "-m" , "flask", "run"]
