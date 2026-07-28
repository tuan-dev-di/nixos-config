{

  description = "multi-machines NixOS config";

  inputs = {
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia-greeter = {
      url = "github:noctalia-dev/noctalia-greeter";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fcitx5-lotus = {
      url = "github:LotusInputMethod/fcitx5-lotus";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = inputs@{ self, nixpkgs, home-manager,  ... }:
    let
      mkHost = { hostname, system ? "x86_64-linux", username ? "arys" }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/${hostname}/configuration.nix
            ./modules/nixos/common.nix
            ./modules/nixos/noctalia.nix
            ./modules/nixos/niri.nix
            ./modules/nixos/flatpak.nix
            ./modules/nixos/fcitx5-lotus.nix
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              home-manager.users.${username} = import ./home/${username}/home.nix;
            }
          ];
        };
    in
      {
      nixosConfigurations = {
        nixos = mkHost { hostname = "nixos"; };
	
      };
    };
}
