{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.noctalia.nixosModules.default
    inputs.noctalia-greeter.nixosModules.default
  ];

  programs = {
    noctalia = {
      enable = true;
      recommendedServices.enable = true;
    };
    noctalia-greeter.enable = true;
  };
}	
