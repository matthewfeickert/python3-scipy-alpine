FROM python:3.7-alpine3.10

RUN apk --no-cache add \
      lapack \
      libstdc++ && \
    apk --no-cache add --virtual \
      .builddeps \
      g++ \
      gcc \
      gfortran \
      musl-dev \
      lapack-dev \
      py3-scipy && \
    python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    rm -rf /root/.cache
ENV PYTHONPATH=/usr/lib/python3.7/site-packages
