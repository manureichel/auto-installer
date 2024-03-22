Write-Output "Installing Apps"
$apps = @(
    @{name = "7zip.7zip" },
    @{name = "Adobe.Acrobat.Reader.64-bit" },
    @{name = "Amazon.AWSCLI" },
    @{name = "c0re100.qBittorrent-Enhanced-Edition" },
    @{name = "clsid2.mpc-hc" },
    @{name = "dbeaver.dbeaver" },
    @{name = "Discord.Discord" },
    @{name = "Docker.DockerDesktop" },
    @{name = "EpicGames.EpicGamesLauncher" },
    @{name = "Git.Git" },
    @{name = "Google.Chrome" },
    @{name = "Hashicorp.Terraform" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "Logitech.GHUB" },
    @{name = "Microsoft.PowerShell" },
    @{name = "Microsoft.VisualStudioCode" },
    @{name = "Microsoft.WindowsTerminal" },
    @{name = "NickeManarin.ScreenToGif" },
    @{name = "Notepad++.Notepad++" },
    @{name = "OpenJS.NodeJS.LTS" },
    @{name = "Python.Python.3.9" },
    @{name = "Telegram.TelegramDesktop" },
    @{name = "Terraform-docs.Terraform-docs" },
    @{name = "Valve.Steam" },
    @{name = "WhatsApp.WhatsApp" },
    @{name = "D4koon.WhatsappTray" },
    @{name = "Zoom.Zoom" },
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
