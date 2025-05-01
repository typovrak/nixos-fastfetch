# 🎨 NixOS Fastfetch

> Declarative NixOS module to install Fastfetch and deploy a secure per-user configuration for rich and speedy system info.

## 📦 Features

- 🔒 **Secure config directory :** Creates and protects ```~/.config/fastfetch``` with ```700``` permissions.

- ⚙️ **Config deployment :** Installs your ```config.jsonc``` into ```~/.config/fastfetch``` with ```600``` permissions.

- ⚡ **Fastfetch package :** Ensures ```fastfetch``` is available in ```environment.systemPackages```.

- 🔄 **Idempotent :** Cleans and recreates config on each rebuild without removing other user data.

- ✨ **Rich modules :** Displays OS, host, kernel, uptime, packages, shell, DE/WM, CPU/GPU, memory, disk, network, battery, locale, colors and more.

- 💾 **Backup guidance :** Documentation includes commands to back up any existing Fastfetch config before applying changes.

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.config/fastfetch{,.bak}
```

## 🚀 Installation
Fetch the module directly in your main nixos configuration at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-fastfetch = fetchGit {
    url = "https://github.com/typovrak/nixos-fastfetch.git";
    ref = "main";
    rev = "0de88e5016970681a82ce2b07966a2fac9a36d33"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-fastfetch}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

## 🎬 Usage

Run it with ```fastfetch``` in a terminal. You can also add this command to your ```.zshrc``` or ```.bashrc``` to this this prompt everytime you open a terminal.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.  
You can also support me on ☕ [Buy me a coffee](https://www.buymeacoffee.com/typovrak).

## 📝 License

Distributed under the [MIT license](LICENSE.md).

## 📜 Code of conduct

This project maintains a [code of conduct](.github/CODE_OF_CONDUCT.md) to ensure a respectful, inclusive and constructive community.

## 🛡️ Security

To report vulnerabilities or learn about supported versions and response timelines, please see our [security policy](.github/SECURITY.md).

---

<p align="center"><i>Made with 💜 by typovrak</i></p>
