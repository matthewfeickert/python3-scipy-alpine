FROM python:3.7-alpine3.10

RUN apk --no-cache add --virtual \
      .builddeps \
      gcc \
      gfortran \
      musl-dev && \
    python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    python -m pip install --no-cache-dir numpy==1.17.4 && \
    apk del .builddeps && \
    rm -rf /root/.cache
RUN apk --no-cache add \
      lapack \
      libstdc++ && \
    apk --no-cache add --virtual \
      .builddeps \
      g++ \
      gcc \
      gfortran \
      musl-dev \
      lapack-dev && \
    python -m pip install --no-cache-dir --upgrade pip setuptools wheel && \
    python -m pip install --no-cache-dir --no-binary scipy==1.4.0 && \
    apk del .builddeps && \
    rm -rf /root/.cache
