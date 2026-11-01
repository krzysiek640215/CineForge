@echo off
echo === CineForge AUTO BUILDER FINAL ===
echo Ten skrypt sam pobierze Gradle + Android SDK i zbuduje APK
echo Potrzebny internet i Java 17 z https://adoptium.net/
echo.

if not exist "app\build.gradle.kts" (
  echo Uruchom ten plik W FOLDERZE PROJEKTU obok folderu app!
  pause
  exit /b
)

java -version >nul 2>&1
if %errorlevel% neq 0 (
  echo Zainstaluj Java 17 z adoptium.net!
  pause
  exit /b
)

if not exist "gradle-8.6\bin\gradle.bat" (
  echo Pobieram Gradle...
  powershell -Command "Invoke-WebRequest https://services.gradle.org/distributions/gradle-8.6-bin.zip -OutFile gradle.zip"
  powershell -Command "Expand-Archive -Force gradle.zip -DestinationPath ."
  del gradle.zip
)
set PATH=%CD%\gradle-8.6\bin;%PATH%

if not exist "android-sdk\cmdline-tools\latest\bin\sdkmanager.bat" (
  echo Pobieram Android SDK...
  mkdir android-sdk
  powershell -Command "Invoke-WebRequest https://dl.google.com/android/repository/commandlinetools-win-11076708_latest.zip -OutFile sdk.zip"
  powershell -Command "Expand-Archive -Force sdk.zip -DestinationPath android-sdk-temp"
  mkdir android-sdk\cmdline-tools\latest
  xcopy /E /I /Y android-sdk-temp\cmdline-tools\* android-sdk\cmdline-tools\latest\
  rmdir /S /Q android-sdk-temp
  del sdk.zip
)

set ANDROID_HOME=%CD%\android-sdk
set ANDROID_SDK_ROOT=%CD%\android-sdk
set PATH=%ANDROID_HOME%\cmdline-tools\latest\bin;%ANDROID_HOME%\platform-tools;%PATH%

echo Instaluje platformy...
echo y | sdkmanager --licenses >nul
call sdkmanager "platforms;android-34" "build-tools;34.0.0" "platform-tools"

echo sdk.dir=%CD%\android-sdk> local.properties

echo Buduje APK...
call gradle assembleDebug

if exist "app\build\outputs\apk\debug\app-debug.apk" (
  echo SUKCES! APK w app\build\outputs\apk\debug\
  explorer app\build\outputs\apk\debug\
) else (
  echo BLAD - wyslij log
)
pause