### PowerShell Application Installer Script

#### Overview

This PowerShell script automates the installation of various applications on a Windows system using the Windows Package Manager (`winget`). Here's a brief overview of its functionality:

#### Instructions

- The script starts with instructions to ensure that the Microsoft App Installer is installed on the system.

#### Application List

- It defines a list of applications to install. Each application is represented as a hash table with a `name` key specifying the application identifier.

#### Installation Process

- The script iterates through the list of applications and checks if each application is already installed using the `winget list` command with the `--exact` flag. If an application is not installed, it proceeds to install it using the `winget install` command with various flags like `--accept-source-agreements` and `--accept-package-agreements` to automate the installation process.

#### Skip Installed Applications

- If an application is already installed, the script skips the installation process and prints a message indicating that the application is already installed.

#### Using `winget`

Here's a quick tutorial on using `winget`:

1. **Installation**: `winget` comes pre-installed on new computers, but if you don't have it, just install the App Installer from the [Microsoft Store](https://www.microsoft.com/en-us/p/app-installer/9nblggh4nns1).

2. **Listing Installed Apps**: Use `winget list` to see all applications you currently have installed and labels which ones are available through `winget`. This is a good way to prepare your own setup script, especially if you're planning to get a new computer.

3. **Searching for Apps**: Use `winget search <name of app>` to find out if an app you want can be installed through `winget`. Alternatively, you can browse apps at [winget.run](https://winget.run/).
