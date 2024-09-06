{ config, pkgs, lib, ... }:
{
  programs = {
    atuin = {
      enable = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
      settings = { };
    };
  };
}

