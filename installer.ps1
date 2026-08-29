$ErrorActionPreference = 'SilentlyContinue'

$apps = @(
    "7zip.7zip",
    "Blizzard.BattleNet",
    "c0re100.qBittorrent-Enhanced-Edition",
    "clsid2.mpc-hc",
    "Discord.Discord",
    "Surfshark.Surfshark",
    "CurseForge.CurseForge",
    "Adobe.Acrobat.Reader.64-bit",
    "EpicGames.EpicGamesLauncher",
    "Google.Chrome",
    "Logitech.GHUB",
    "Valve.Steam"
)

Write-Host "Iniciando instalación y verificación de aplicaciones..." -ForegroundColor Cyan

foreach ($app in $apps) {
    $installed = winget list --exact --id $app --accept-source-agreements

    if (-not $installed) {
        Write-Host "Instalando: $app" -ForegroundColor Yellow
        winget install --exact --id $app --silent --accept-source-agreements --accept-package-agreements
    }
    else {
        Write-Host "Omitiendo: $app (ya está instalado)" -ForegroundColor Green
    }
}

Write-Host "Proceso finalizado." -ForegroundColor Cyan
