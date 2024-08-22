@echo off

REM Stop and remove the project's containers
docker-compose down
REM Remove unused volumes
docker volume prune -f
REM Remove unused networks
docker network prune -f

REM Define the Odoo web data directory
set ODOO_WEB_DATA_DIR=.\odoo-web-data

REM Check if the directory exists
if exist "%ODOO_WEB_DATA_DIR%" (
    REM Remove the directory itself
    rmdir /s /q "%ODOO_WEB_DATA_DIR%"
)
