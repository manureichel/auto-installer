Write-Output "Installing Apps"
echo Y | winget search Microsoft.WindowsTerminal > $null
$apps = @(
    @{name = "7zip.7zip" },
    @{name = "c0re100.qBittorrent-Enhanced-Edition" },
    @{name = "clsid2.mpc-hc" },
    @{name = "Discord.Discord" },
    @{name = "Docker.DockerDesktop" },
    @{name = "EpicGames.EpicGamesLauncher" },
    @{name = "Git.Git" },
    @{name = "Google.Chrome" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "Logitech.GHUB" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "Telegram.TelegramDesktop" },
    @{name = "Terraform-docs.Terraform-docs" },
    @{name = "Blizzard.BattleNet" },
    @{name = "OpenJS.NodeJS" },
    @{name = "Valve.Steam" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing: " $app.name
        winget install -e -h --accept-source-agreements --accept-package-agreements --id $app.name 
    }
    else {
        Write-host "Skipping: " $app.name " (already installed)"
    }
}
