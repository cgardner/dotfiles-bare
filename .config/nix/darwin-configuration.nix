{ config, pkgs, ... }:
let mainUser = "craiggardner";
in {
  imports = [ <home-manager/nix-darwin> ];
  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
      bat
      eza
      fd
      git
      direnv
      # espanso
      gnupg
      gopass
      gopass-jsonapi
      neovim
      ripgrep
      starship
      tmux
      tmuxinator
      zoxide
      zsh
      zsh-vi-mode
    ];

  environment.darwinConfig = "$HOME/.config/nix/darwin-configuration.nix";

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  users.users.${mainUser} = {
    home = "/Users/${mainUser}";
    shell = pkgs.zsh;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = false;
    users.${mainUser} = import ./home;
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  # Disable the “Are you sure you want to open this application?” dialog
  system.defaults.LaunchServices.LSQuarantine = false;

  # Hide Desktop Icons
  system.defaults.finder.CreateDesktop = false;

  # Automatically hide and show the dock
  system.defaults.dock.autohide = true;

  # Don't show recent applications in the dock
  system.defaults.dock.show-recents = false;

}
