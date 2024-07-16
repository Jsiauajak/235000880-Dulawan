@echo off

rem Sort files by date on C drive (modify /d parameter for specific date range)
forfiles /P C:\ /S /M . /D -7 /C "cmd /c if @filetime < @isdir time (move @path Z:\archive)"

rem Sort archived files by size
forfiles /P Z:\archive /S /M . /O S /C "cmd /c echo @file"

rem Prompt for deletion (modify as needed)
echo Do you want to delete old, large files from Z:\archive (Y/N)?
choice /C Y,N /N Text:

if %errorlevel%==1 (
  echo Files will be kept.
  exit /b
)

rem Delete confirmation (add logic for file size and date filtering)
echo Deleting large files from Z:\archive... (implement file deletion logic here)

echo Completed!