$ErrorActionPreference = 'SilentlyContinue'

$apps = @(
    "7zip.7zip",
    "Adobe.Acrobat.Reader.64-bit",
    "Blizzard.BattleNet",
    "clsid2.mpc-hc",
    "CurseForge.CurseForge",
    "Google.Chrome",
    "Nullsoft.Winamp",
    "Spotify.Spotify",
    "Surfshark.Surfshark",
    "Valve.Steam",
    "c0re100.qBittorrent-Enhanced-Edition",
    "WhatsApp.WhatsApp"
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
