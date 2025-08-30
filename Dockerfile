FROM registry.os.wiz.io/python:3.13

WORKDIR /app

# WIZOS_CLIENT secrets are passed to this dockerfile by `docker build`
# use apk-auth to install packages from the wizos apk registry
RUN --mount=type=secret,id=WIZOS_CLIENT_ID \
 --mount=type=secret,id=WIZOS_CLIENT_SECRET \
 export $(WIZOS_SECRET_PATH=/run/secrets apk-auth) && \
 apk add --no-cache \
 python3

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY ./src/ .

COPY ./app/ ./app/

ENTRYPOINT ["python3", "main.py"]

