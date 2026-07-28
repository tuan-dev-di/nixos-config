{ config, pkgs, ... }:
{
  nix.settings = 
    {
      experimental-features = 
        [
          "nix-command"
          "flakes"
        ];
    };
  time.timeZone = "Asia/Ho_Chi_Minh";

  i18n.defaultLocale = "en_US.UTF-8";

  programs.zsh.enable = true;
  security.polkit.enable = true;   
  users.users.arys = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = 
      [
        "wheel"
        "networkmanager"
      ];
  }; 
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    EDITOR = "nvim"; # or "nvim", "vim", "emacs", etc.
    VISUAL = "nvim";
    SUDO_EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
    # ETC
    nil
    vlc
    tree-sitter
    neovim
    ghostty
    xwayland-satellite
    unzip
    flatpak
    fastfetch
    pay-respects
    gpu-screen-recorder
    lact
    kdePackages.dolphin

    # Dev Env
    nodejs_26
    jdk17
    dotnet-sdk_11
    go
    rustc
    gcc
    git
    github-desktop
    postgresql_16
    vscode-fhs
    postman
    obsidian

    # Web browser
    google-chrome
    brave
    microsoft-edge
    ungoogled-chromium

    # Apps
    stremio-linux-shell
    vesktop
  ];
}
