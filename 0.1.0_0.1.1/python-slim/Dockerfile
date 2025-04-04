# ./0.1.0_0.1.1/python-slim/Dockerfile
FROM python:3.11-slim

ARG VERSION=0.1.1
ARG CHECKSUM=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b

WORKDIR /StaticJinja

# Загрузка с проверкой хеша
ADD --checksum=sha256:${CHECKSUM} \
    https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/${VERSION}.tar.gz \
    /tmp/sjp.tar.gz



RUN tar xzf /tmp/sjp.tar.gz --strip-components=1 -C /StaticJinja && rm /tmp/sjp.tar.gz
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt 


ENTRYPOINT ["/StaticJinja/venv/bin/python3", "main.py"]

CMD ["--srcpath=/app/templates/", "--outpath=/app/build/"]