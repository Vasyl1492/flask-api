FROM python:alpine as campiler

RUN apk update && apk add --no-cache git && apk add bash

WORKDIR /app

RUN python3 -m venv /app/venv
ENV PATH="/app/venv/bin:$PATH"

COPY . /app

# python3-venv && python3-pip
# python3 -m venv venv && source venv/bin/activate && pip install -r requirements.txt

RUN source venv/bin/activate


FROM python:alpine as runner

WORKDIR /app

ENV PATH="/app/venv/bin:$PATH"

RUN pip install --upgrade pip

COPY . /app

RUN pip install -r requirements.txt

# EXPOSE 80
# EXPOSE 3306
EXPOSE 5000

CMD [ "python3", "api.py" ]






