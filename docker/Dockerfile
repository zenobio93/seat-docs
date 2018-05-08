FROM python:3-alpine

RUN pip install mkdocs mkdocs-material && \
    mkdir /docs

WORKDIR /docs

CMD mkdocs serve
