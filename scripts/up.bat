@echo off

REM Define variables
set CONFIG_DIR=config
set ADDONS_CUSTOM_DIR=addons-custom
set ADDONS_ODOO_DIR=addons-odoo
set ODOO_DATA_DIR=odoo-web-data

REM Move the configuration file to the configuration directory if it exists
if exist odoo.conf (
    set ODOO_CONF=%CONFIG_DIR%\odoo.conf
    move /y odoo.conf %CONFIG_DIR% REM /y forces overwrite without prompting

    REM Create necessary directories if they don't exist
    if not exist %CONFIG_DIR% mkdir %CONFIG_DIR%
    if not exist %ADDONS_CUSTOM_DIR% mkdir %ADDONS_CUSTOM_DIR%
    if not exist %ADDONS_ODOO_DIR% mkdir %ADDONS_ODOO_DIR%
    if not exist %ODOO_DATA_DIR% mkdir %ODOO_DATA_DIR%
)

REM Launch Docker containers
docker-compose up
