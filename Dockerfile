FROM python:3.7-alpine3.10

RUN apk --no-cache add --virtual \
      .builddeps \
      lapack \
      libstdc++ \
      g++ \
      gcc \
      gfortran \
      musl-dev \
      lapack-dev && \
    apk --no-cache add \
      py3-scipy && \
    apk del .builddeps && \
    python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    rm -rf /root/.cache
ENV PYTHONPATH=/usr/lib/python3.7/site-packages
