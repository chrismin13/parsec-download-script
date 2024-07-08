@echo off

echo ====== ------ ======
echo This script is not affiliated with parsec.app.
echo For help and support, visit: 
echo https://github.com/chrismin13/parsec-download-script/
echo ====== ------ ======

if exist "%temp%\ParsecPortable" (
    rmdir /s /q "%temp%\ParsecPortable"
)
mkdir "%temp%\ParsecPortable"
curl https://builds.parsecgaming.com/package/parsec-flat-windows.zip -o "%temp%\ParsecPortable\parsec.zip"
Call :UnZipFile "%temp%\ParsecPortable\" "%temp%\ParsecPortable\parsec.zip"
del "%temp%\ParsecPortable\parsec.zip"
curl https://raw.githubusercontent.com/chrismin13/parsec-download-script/main/config.txt -o "%temp%\ParsecPortable\config.txt" -fsSL
start /d "%temp%\ParsecPortable" parsecd.exe
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%