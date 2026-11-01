#!/bin/bash
echo "Budowanie APK CineForge..."
chmod +x gradlew
./gradlew assembleDebug
echo "APK gotowy w: app/build/outputs/apk/debug/app-debug.apk"