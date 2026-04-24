# Скрипт для сборки Alpaka MSG локально
Write-Host "Начинаю сборку Alpaka MSG..." -ForegroundColor Cyan

if (!(Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Host "Ошибка: Flutter не найден в системе. Пожалуйста, установите Flutter SDK." -ForegroundColor Red
    exit
}

Write-Host "1. Получение зависимостей..."
flutter pub get

Write-Host "2. Очистка предыдущих сборок..."
flutter clean

Write-Host "3. Сборка APK (Release)..."
flutter build apk --release

if ($LASTEXITCODE -eq 0) {
    Write-Host "Сборка успешно завершена!" -ForegroundColor Green
    Write-Host "Файл находится здесь: build\app\outputs\flutter-apk\app-release.apk" -ForegroundColor Yellow
} else {
    Write-Host "Ошибка при сборке." -ForegroundColor Red
}
