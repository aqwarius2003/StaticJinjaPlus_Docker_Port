# ./develop/ubuntu/Dockerfile
FROM ubuntu:24.04

RUN apt-get update && \
    apt-get install -y python3 python3-pip python3.12-venv git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /StaticJinja

# Получаем исходный код последней версии
ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinja/

# Создаем виртуальное окружение и устанавливаем зависимости
RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/StaticJinja/venv/bin/python3", "main.py"]
CMD ["--srcpath=/app/templates/", "--outpath=/app/build/"]