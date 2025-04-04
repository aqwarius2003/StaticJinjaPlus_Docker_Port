# ./develop/python-slim/Dockerfile
FROM python:3.11-slim

WORKDIR /StaticJinja

ADD https://github.com/MrDave/StaticJinjaPlus.git /StaticJinja

RUN python3 -m venv venv
RUN . venv/bin/activate && pip install --no-cache-dir -r requirements.txt

ENTRYPOINT ["/StaticJinja/venv/bin/python3", "main.py"]

CMD ["--srcpath=/app/templates/", "--outpath=/app/build/"]