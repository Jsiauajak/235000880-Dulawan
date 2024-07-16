echo Select a utility:
echo 1. ipconfig
echo 2. tasklist / taskkill
echo 3. chkdsk
echo 4. format (Use with caution!)
echo 5. defrag
echo 6. find
echo 7. attrib

choice /C 1,2,3,4,5,6,7 /N Text:

if errorlevel 1 (
  echo You entered an invalid choice.
  exit /b 1
)

if %errorlevel%==1 (
  ipconfig
)

if %errorlevel%==2 (
  echo Enter tasklist or taskkill:
  set /p command=
  if "%command%"=="taskkill" (
    echo Enter process ID or name to kill:
    set /p process=
    taskkill /F /IM "%process%"
  ) else (
    tasklist
  )
)

if %errorlevel%==3 (
  echo Enter the drive to check (e.g., C:):
  set /p drive=
  chkdsk %drive% /f (Optional: chkdsk %drive% /r for repair)
)

if %errorlevel%==4 (
  echo Formatting permanently erases data! Are you sure (Y/N)?
  choice /C Y,N /N Text:
  if %errorlevel%==1 (
    echo Enter the drive to format (e.g., C:):
    set /p drive=
    format %drive% /q (format %drive% /fs:NTFS for specific file system)
  ) else (
    exit /b
  )
)

if %errorlevel%==5 (
  echo Enter the text to find and file/folder path (e.g., find "text" C:\folder):
  set /p search=
  findstr %search% %*
)

if %errorlevel%==6 (
  echo Enter the file attributes to change (e.g., attrib +r filename.txt):
  set /