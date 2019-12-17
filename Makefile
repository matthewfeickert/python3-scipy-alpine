default: image

all: image

image:
	docker build -f Dockerfile \
	--cache-from matthewfeickert/python3-scipy-alpine:latest \
	-t matthewfeickert/python3-scipy-alpine:latest \
	-t matthewfeickert/python3-scipy-alpine:scipy-1.4.0 \
	--compress .
