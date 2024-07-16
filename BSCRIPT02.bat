echo Select a shape:
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral

choice /C 1,2,3 /N Text:

if errorlevel 1 (
  echo You entered an invalid choice.
  exit /b 1
)

if %errorlevel%==1 (
  echo Enter the radius of the circle:
  set /p radius=
  set area=3.14159 * %radius% * %radius%
  echo Circle area: %area%
)

if %errorlevel%==2 (
  echo Enter the lengths of the three sides of the triangle:
  set /p side1=
  set /p side2=
  set /p side3=
  set s=(%side1% + %side2% + %side3%) / 2
  set area=sqrt(%s% * (%s% - %side1%) * (%s% - %side2%) * (%s% - %side3%))
  echo Triangle area: %area%

  if %side1%==%side2% IFF %side1%==%side3% (
    echo Equilateral triangle
  ) else if %side1%==%side2% OR %side1%==%side3% OR %side2%==%side3% (
    echo Isosceles triangle
  ) else (
    echo Scalene triangle
  )
)

if %errorlevel%==3 (
  echo Enter the length and width of the quadrilateral:
  set /p length=
  set /p width=
  set area=%length% * %width%
  echo Quadrilateral area: %area%

  if %length%==%width% (
    echo Square
  ) else (
    echo Rectangle
  )
)