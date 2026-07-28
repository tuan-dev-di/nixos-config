{ config, pkgs, ... }: 

{
  programs = {
    git = {
      enable = true;
      settings.user = {
        name = "tuan-dev-di";
        email = "arys.tomy@outlook.com";
      };
    };
    
    mpvpaper = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        ll = "ls -la";
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
      history.ignorePatterns = ["rm *" "pkill *" "cp *"];

      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [ "git" ];
      };
    };

    brave = {
      enable = true;
      package = pkgs.brave;
    };
    bash = {
      enable = true;
    };
  };



}
