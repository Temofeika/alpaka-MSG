# Скрипт для сборки Alpaka MSG локально
Write-Host "Начинаю сборку Alpaka MSG..." -ForegroundColor Cyan

if (!(Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Host "Ошибка: Flutter не найден в системе. Пожалуйста, установите Flutter SDK." -ForegroundColor Red
    exit
}

Write-Host "1. Получение зависимостей..."
flutter pub get

Write-Host "2. Генерация конфигурации локалей..."
$l10nDir = "lib/l10n"
$xmlDir = "android/app/src/main/res/xml"
if (!(Test-Path $xmlDir)) { New-Item -ItemType Directory -Path $xmlDir }
$xmlFile = "$xmlDir/locale_config.xml"
$content = @('<?xml version="1.0" encoding="utf-8"?>', '<locale-config xmlns:android="http://schemas.android.com/apk/res/android">')
Get-ChildItem -Path "$l10nDir/intl_*.arb" | ForEach-Object {
    $langCode = ($_.BaseName -split '_')[1]
    $content += "    <locale android:name=`"$langCode`"/>"
}
$content += '</locale-config>'
$content | Out-File -FilePath $xmlFile -Encoding utf8

Write-Host "3. Очистка предыдущих сборок..."
flutter clean

Write-Host "4. Сборка APK (Release)..."
flutter build apk --release

if ($LASTEXITCODE -eq 0) {
    Write-Host "Сборка успешно завершена!" -ForegroundColor Green
    Write-Host "Файл находится здесь: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Yellow
} else {
    Write-Host "Ошибка при сборке." -ForegroundColor Red
}
