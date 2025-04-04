# StaticJinjaPlus Docker Images

Докеризированные версии генератора статических сайтов [StaticJinjaPlus](https://github.com/MrDave/StaticJinjaPlus).  
Все образы доступны на [Docker Hub](https://hub.docker.com/r/aqwarius2003/static-jinja-plus).

## 🚀 Быстрый старт

```bash
docker run --rm -v ./templates:/app/templates -v ./build:/app/build aqwarius2003/static-jinja-plus:latest
```

## 🔍 Доступные версии

| Тег образа       | Описание                          | Размер |
|------------------|-----------------------------------|--------|
| `latest`         | Последняя стабильная (Ubuntu)     | ~84MB  |
| `slim`           | Последняя стабильная (Python Slim)| ~78MB  |
| `0.1.0`          | Версия 0.1.0 (Ubuntu)             | ~160MB |
| `0.1.0-slim`     | Версия 0.1.0 (Slim)               | ~78MB  |
| `develop`        | DEV-версия (Ubuntu)               | ~151MB |
| `develop-slim`   | DEV-версия (Slim)                 | ~78MB  |

## 🛠 Использование

### Базовый запуск:
```bash
docker run --rm -v /путь/к/шаблонам:/app/templates -v /путь/к/сборке:/app/build aqwarius2003/static-jinja-plus:TAG
```

### Варианты для Windows (PowerShell):
```powershell
# Для последней версии
docker run --rm -v ${PWD}\templates:/app/templates -v ${PWD}\build:/app/build aqwarius2003/static-jinja-plus:latest

# Для slim-версии
docker run --rm -v ${PWD}\templates:/app/templates -v ${PWD}\build:/app/build aqwarius2003/static-jinja-plus:slim
```

## 📋 Требования
- Установленный [Docker](https://www.docker.com/products/docker-desktop/)
- Авторизация в Docker Hub (`docker login`)

## 🏗 Сборка образов

### Для всех версий (кроме develop):
```bash
curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum
```

### Develop-версии
```bash
# Ubuntu версия
docker build -t aqwarius2003/static-jinja-plus:develop -f develop/ubuntu/Dockerfile .

# Slim версия
docker build -t aqwarius2003/static-jinja-plus:develop-slim -f develop/python-slim/Dockerfile .
```

### Стабильные версии
```bash
# Версия 0.1.0 (Ubuntu)
docker build -t aqwarius2003/static-jinja-plus:0.1.0 -f "0.1.0_0.1.1/ubuntu/Dockerfile" --build-arg VERSION=0.1.0 --build-arg SJP_HASHCHECKSUM=3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444 .

# Версия 0.1.0 (Slim)
docker build -t aqwarius2003/static-jinja-plus:0.1.0-slim -f "0.1.0_0.1.1/python-slim/Dockerfile" --build-arg VERSION=0.1.0 --build-arg CHECKSUM=3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444 .

# Версия 0.1.1 (Ubuntu)
docker build -t aqwarius2003/static-jinja-plus:0.1.1 -f "0.1.0_0.1.1/ubuntu/Dockerfile" --build-arg VERSION=0.1.1 --build-arg SJP_HASHCHECKSUM=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b .

# Версия 0.1.1 (Slim)
docker build -t aqwarius2003/static-jinja-plus:0.1.1-slim -f "0.1.0_0.1.1/python-slim/Dockerfile" --build-arg VERSION=0.1.1 --build-arg CHECKSUM=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b .
```

### Latest-версии
После сборки 0.1.1 можно создать теги latest:
```bash
docker tag aqwarius2003/static-jinja-plus:0.1.1 aqwarius2003/static-jinja-plus:latest
docker tag aqwarius2003/static-jinja-plus:0.1.1-slim aqwarius2003/static-jinja-plus:slim
```

## 📌 Примечания

1. Для Windows используйте обратные слеши в путях: `-v D:\путь\templates:/app/templates`
2. Полный список тегов: https://hub.docker.com/r/aqwarius2003/static-jinja-plus/tags
3. Исходники: https://github.com/aqwarius2003/StaticJinjaPlus-docker
4. Образы используют рабочую директорию `/StaticJinja` и запускаются с параметрами `--srcpath=/app/templates/ --outpath=/app/build/`

---

🔹 *Проект разработан в рамках обучения на [Devman](https://dvmn.org)*
