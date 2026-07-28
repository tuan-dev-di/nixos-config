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
    gcc
    nil
    vlc
    stremio-linux-shell
    obsidian
    tree-sitter
    git
    neovim
    ghostty
    xwayland-satellite
    unzip
    flatpak
    fastfetch
    protonup-qt
    vesktop
    ungoogled-chromium
    pay-respects
    firefox
    gpu-screen-recorder
  ];
}
