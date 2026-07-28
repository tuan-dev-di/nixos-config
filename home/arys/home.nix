{ config, pkgs, ...}:

{
  imports = [
    ../../modules/home-manager/base.nix
  ];

  home.username = "arys";
  home.homeDirectory = "/home/arys";
  home.stateVersion = "26.05";

  home.packages = with pkgs; [
    nodejs_22
    bash-language-server
  ];
  programs = {
    retroarch = {
      enable = true;
      package = pkgs.retroarch-bare;
      cores = {
        mame.enable = true; 
        mame2003.enable = true;
      };
    };
  };
}
