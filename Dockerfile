FROM ubuntu:18.04

EXPOSE 22 1234

COPY todo/ /todo/

RUN bash /todo/000-todo-all.sh
