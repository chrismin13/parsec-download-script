@echo off

:: ====== ------ ======
:: This script is not affiliated with parsec.app.
:: For help and support, visit: 
:: https://github.com/chrismin13/parsec-download-script/
:: ====== ------ ======

mkdir "%temp%\Parsec"
curl https://builds.parsecgaming.com/package/parsec-flat-windows.zip -o "%temp%\Parsec\parsec.zip"
powershell -command "Expand-Archive -Path '%temp%\Parsec\parsec.zip' -DestinationPath '%temp%\Parsec' -Force"
del "%temp%\Parsec\parsec.zip"
curl https://raw.githubusercontent.com/chrismin13/parsec-download-script/main/config.txt -o "%temp%\Parsec\config.txt" -fsSL
start /d "%temp%\Parsec" parsecd.exe
