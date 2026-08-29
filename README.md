# Windows Auto Installer (winget)

A simple and automated PowerShell script to install your favorite applications on Windows using the **Windows Package Manager (`winget`)**.

---

## 🚀 Overview

This script checks a predefined list of application IDs against your system. For each application:
- **If already installed**: It skips it and outputs a notification in green.
- **If not installed**: It installs it automatically and silently in yellow, accepting all source and package agreements.

---

## 📋 Prerequisites

1. **Windows 10 (version 1809 or later) or Windows 11**.
2. **`winget` (Windows Package Manager)**: Pre-installed on modern Windows versions. If missing, install **App Installer** from the [Microsoft Store](https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1) or GitHub Releases.

---

## 💻 How to Run

1. Open **PowerShell** (preferably as Administrator for applications requiring system-level permissions).
2. If script execution is restricted on your system, allow script execution for the current session:
   ```powershell
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
   ```
   *(or `Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process`)*
3. Navigate to the folder containing `installer.ps1` and run:
   ```powershell
   .\installer.ps1
   ```

---

## ⚙️ Customizing the Application List

You can customize the applications installed by editing the `$apps` array inside `installer.ps1`:

```powershell
$apps = @(
    "7zip.7zip",
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "Git.Git"
)
```

### Finding Application IDs with `winget`

- **Search for apps**:
  ```powershell
  winget search <app_name>
  ```
  *(e.g., `winget search vlc` or `winget search discord`)*
- **Browse packages online**: Visit [winget.run](https://winget.run/) or [winstall.app](https://winstall.app/).
- **List currently installed packages**:
  ```powershell
  winget list
  ```

---

## 🛠️ How It Works

- **Verification**: Uses `winget list --exact --id <PackageId> --accept-source-agreements` to accurately verify if the application is already on the machine.
- **Automated Installation**: Runs `winget install --exact --id <PackageId> --silent --accept-source-agreements --accept-package-agreements` for unattended installation.
- **Visual Feedback**: Provides clear, color-coded console messages (Cyan, Yellow, Green) for easy tracking.

