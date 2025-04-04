@echo off

:: Залогиньтесь в Docker Hub
docker login

:: Загружаем все образы
for %%t in (
  "latest"
  "0.1.0-slim"
  "0.1.1-slim"
  "0.1.0-ubuntu"
  "0.1.1-ubuntu"
  "develop-slim"
  "develop-ubuntu"
) do (
  echo Загрузка образа aqwarius2003/static-jinja-plus:%%~t
  docker push aqwarius2003/static-jinja-plus:%%~t
)

echo Все образы успешно загружены
pause