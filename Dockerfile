# FROM python:3.6
# ENV PYTHONUNBUFFERED 1
# RUN mkdir /webapps
# WORKDIR /webapps
# # Installing OS Dependencies
# RUN apt-get update && apt-get upgrade -y && apt-get install -y \
# libsqlite3-dev
# RUN pip install -U pip setuptools
# COPY requirements.txt requirements.txt
# RUN pip install -r requirements.txt
# ADD . /webapps/
# # Django service
# EXPOSE 8000

# pull official base image
FROM python:3.11.4-slim-buster

# set work directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# copy project
COPY . .