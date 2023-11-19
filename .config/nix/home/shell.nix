{ config, pkgs, lib, ...}:
{
  programs = {
    bat = {
      enable = true;
    };

    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
        format = lib.concatStrings [
          "$username"
          "$hostname"
          "$directory"
          "$git_branch"
          "$git_status"
          "$golang"
          "$java"
          "$nodejs"
          "$rust"
          "$character"
        ];
        right_format = lib.concatStrings [
          "$memory_usage"
          "$time"
          "$nix_shell"
          "$line_break"
        ];
        git_branch.symbol = " ";

        time = {
          format = " [$time]($style)";
          disabled = false;
        };
      };
    };

    tmux = {
      enable = true;
      shortcut = "a";
      tmuxinator.enable = true;
      keyMode = "vi";
      extraConfig = 
      '' 
        # Pane Movement
        unbind Up
        bind h select-pane -U
        unbind Down
        bind k select-pane -D
        unbind j
        bind j select-pane -L
        unbind l
        bind l select-pane -R
        
        # New Window
        unbind "
        unbind %
        bind " split-window -c "#{pane_current_path}"
        bind v split-window -h -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"
      '';
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    zsh = {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;
      envExtra = 
        '' 
          PATH="$PATH:/opt/homebrew/bin"

          clone() {
            REPO_URL=$1
            REPO_BASE=$(basename $REPO_URL)
            REPO_PATH="$\{REPO_BASE%.*\}"
            pushd $HOME/src
            git clone $REPO_URL
            popd
            tmuxinator start project $HOME/src/$REPO_PATH
          }
          
        '';
      history.extended = true;
      shellAliases = {
        "muxs" = "${pkgs.tmuxinator}/bin/tmuxinator start";
        "p" = "${pkgs.tmuxinator}/bin/tmuxinator start project";
        ",gp" = "gopass show -c ";
        "g" = "git";
        "ls" = "eza --long --git";
        "tree" = "eza --tree";
        ",c" = "${pkgs.git}/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME";
      };
    };
  };
}
