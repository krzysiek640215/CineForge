@echo off
echo Budowanie APK CineForge...
echo Sprawdzam Android Studio...
where gradle >nul 2>nul
if %errorlevel% neq 0 (
  echo Instaluje gradle przez Android Studio...
  echo Otworz projekt w Android Studio i kliknij Build -> Build APK(s)
  pause
  exit /b
)
call gradlew assembleDebug
echo.
echo APK gotowy w: app\build\outputs\apk\debug\app-debug.apk
pause