#!/bin/bash
echo "CineForge - Auto Builder"
if [ ! -f "app/build.gradle.kts" ]; then echo "Uruchom w folderze projektu!"; exit 1; fi
if ! command -v java &> /dev/null; then echo "Zainstaluj Java 17: https://adoptium.net/"; exit 1; fi
if [ ! -d "gradle-8.6" ]; then
  echo "Pobieram Gradle..."
  curl -L https://services.gradle.org/distributions/gradle-8.6-bin.zip -o gradle.zip
  unzip -o gradle.zip
  rm gradle.zip
fi
export PATH=$PWD/gradle-8.6/bin:$PATH
gradle assembleDebug
echo "APK w: app/build/outputs/apk/debug/app-debug.apk"