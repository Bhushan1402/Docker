FROM postgres:latest
ADD . /chatApplication
WORKDIR /chatApplication
COPY createdb.sql /docker-entrypoint-initdb.d

