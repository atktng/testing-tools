FROM python:3.7.3

WORKDIR /work

COPY ./requirements.txt /work/

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

