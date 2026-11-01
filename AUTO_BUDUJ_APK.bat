@echo off
setlocal
echo ==========================================
echo  CineForge Studio - AUTOMATYCZNY BUILDER
echo ==========================================
echo.

REM Sprawdz gdzie jest projekt
if not exist "app\build.gradle.kts" (
  echo BLAD: Uruchom ten plik W FOLDERZE projektu CineForge!
  echo Ma byc obok folderu app
  pause
  exit /b
)

REM 1. Sprawdz Jave
java -version >nul 2>&1
if %errorlevel% neq 0 (
  echo Instaluje Jave...
  echo Pobierz Jave 17 z https://adoptium.net/ i zainstaluj, potem uruchom ponownie
  pause
  exit /b
)

REM 2. Pobierz Gradle jesli brak
if not exist "gradle-8.6" (
  echo Pobieram Gradle 8.6...
  powershell -Command "Invoke-WebRequest -Uri https://services.gradle.org/distributions/gradle-8.6-bin.zip -OutFile gradle.zip"
  powershell -Command "Expand-Archive -Force gradle.zip -DestinationPath ."
  del gradle.zip
  echo Gradle pobrany!
)

set PATH=%CD%\gradle-8.6\bin;%PATH%

REM 3. Buduj
echo.
echo Buduje APK... to potrwa 2-3 minuty pierwszy raz
call gradle assembleDebug --stacktrace

if exist "app\build\outputs\apk\debug\app-debug.apk" (
  echo.
  echo ==========================================
  echo  SUKCES! APK GOTOWY:
  echo  app\build\outputs\apk\debug\app-debug.apk
  echo ==========================================
  explorer app\build\outputs\apk\debug\
) else (
  echo.
  echo BLAD budowania - wyslij mi log
)

pause