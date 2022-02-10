@echo off
setlocal

mkdir "%temp%\Parsec"

curl https://builds.parsecgaming.com/package/parsec-flat-windows32.zip -o "%temp%\Parsec\parsec.zip"
Call :UnZipFile "%temp%\Parsec\" "%temp%\Parsec\parsec.zip"
del "%temp%\Parsec\parsec.zip"

curl https://raw.githubusercontent.com/chrismin13/parsec-download-script/main/config.txt -o "%temp%\Parsec\config.txt"
start /d "%temp%\Parsec" parsecd.exe

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
