# Jak zbudować APK z CineForge Studio

## Opcja 1: W Android Studio (najprostsza - 2 kliknięcia)
1. Otwórz projekt CineForge_Studio
2. Poczekaj na Sync Gradle (na dole pasek)
3. Góra menu: Build -> Build Bundle(s) / APK(s) -> Build APK(s)
4. Po minucie: kliknij "locate" w dymku na dole
5. APK jest w: app/build/outputs/apk/debug/app-debug.apk
6. Skopiuj na telefon i zainstaluj

## Opcja 2: Komenda
./gradlew assembleDebug

## Opcja 3: Automatycznie przez GitHub (bez Android Studio)
1. Utwórz repo na GitHub
2. Wgraj cały folder CineForge_Studio
3. Wejdź w Actions -> Build APK -> Run workflow
4. Po 3 minutach pobierzesz gotowy APK z zakładki Artifacts

APK debug instaluje się od razu, nie wymaga podpisu.

Aby zrobić wersję na Sklep Play:
Build -> Generate Signed Bundle / APK -> Android App Bundle