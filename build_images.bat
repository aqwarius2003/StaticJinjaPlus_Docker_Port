@echo off
chcp 866
setlocal enabledelayedexpansion

:: Проверка доступности Docker
docker info > nul 2>&1
if %errorlevel% neq 0 (
    echo Docker не доступен. Проверьте, что Docker Desktop запущен и работает.
    goto :end
)

:: Ваши данные
set DOCKER_USERNAME=aqwarius2003
set IMAGE_NAME=static-jinja-plus

:: Сборка develop версий (без хешей)
echo Сборка develop-версий...
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:develop -f develop/ubuntu/Dockerfile .
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:develop-slim -f develop/python-slim/Dockerfile .

:: Установка версий и хешей
set VERSION_010=0.1.0
set VERSION_011=0.1.1
set HASH_010=3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444
set HASH_011=30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b

:: Сборка версии 0.1.0
echo Сборка версии %VERSION_010%...
:: Ubuntu версия
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_010% ^
  -f "0.1.0_0.1.1/ubuntu/Dockerfile" ^
  --build-arg VERSION=%VERSION_010% ^
  --build-arg SJP_HASHCHECKSUM=%HASH_010% .

:: Slim версия
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_010%-slim ^
  -f "0.1.0_0.1.1/python-slim/Dockerfile" ^
  --build-arg VERSION=%VERSION_010% ^
  --build-arg CHECKSUM=%HASH_010% .

:: Сборка версии 0.1.1
echo Сборка версии %VERSION_011%...
:: Ubuntu версия
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_011% ^
  -f "0.1.0_0.1.1/ubuntu/Dockerfile" ^
  --build-arg VERSION=%VERSION_011% ^
  --build-arg SJP_HASHCHECKSUM=%HASH_011% .

:: Slim версия
docker build -t %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_011%-slim ^
  -f "0.1.0_0.1.1/python-slim/Dockerfile" ^
  --build-arg VERSION=%VERSION_011% ^
  --build-arg CHECKSUM=%HASH_011% .

:: Создаем тег latest
docker tag %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_011% %DOCKER_USERNAME%/%IMAGE_NAME%:latest
docker tag %DOCKER_USERNAME%/%IMAGE_NAME%:%VERSION_011%-slim %DOCKER_USERNAME%/%IMAGE_NAME%:slim

echo Все образы успешно собраны

:end
pause