FROM ubuntu:24.04

ARG VERSION=0.1.1
ARG SJP_HASHCHECKSUM=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3.12-venv && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /StaticJinja

# Загрузка и распаковка исходников с проверкой хеша
ADD --checksum=sha256:${SJP_HASHCHECKSUM} \
    https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${VERSION}.tar.gz \
    /tmp/sjp.tar.gz

RUN tar xzf /tmp/sjp.tar.gz --strip-components=1 -C /StaticJinja && rm /tmp/sjp.tar.gz
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/StaticJinja/venv/bin/python3", "main.py"]

CMD ["--srcpath=/app/templates/", "--outpath=/app/build/"]