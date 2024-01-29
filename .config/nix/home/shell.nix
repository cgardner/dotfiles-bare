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
        continuation_prompt = "▶▶ ";
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
          "$php"
          "$rust"
          "$character"
        ];
        right_format = lib.concatStrings [
          "$memory_usage"
          "$time"
          "$nix_shell"
          "$battery"
          # "$line_break"
        ];

        git_branch.symbol = " ";

        nodejs = {
          format = "[$symbol($version)]($style) ";
          symbol = " ";
          version_format = "$major.$minor";
        };

        php = {
          format = "[$symbol($version)]($style) ";
          symbol = " ";
          version_format = "$raw.$minor";
        };

        nix_shell = {
          format = "[$symbol$state]($style) ";
          symbol = "❄️ ";
          pure_msg = "💠";
          impure_msg = "🚯";
        };

        time = {
          format = "[$time]($style) ";
          disabled = false;
        };

        username = {
          format = "[$user@]($style)";
          show_always = true;
        };

        hostname = {
          ssh_only = false;
        };

        battery = {
          disabled = true;
          full_symbol = "🔋";
          charging_symbol = "⚡️";
          discharging_symbol = "💀";
          display = {
            threshold = 90;
          };
        };

        git_status = {
          ahead = "⇡\${count}";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
          behind = "⇣\${count}";
        };

        memory_usage = {
          format = "$symbol [$ram( \| $swap)]($style) ";
          symbol = "🐏 ";
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

        set-option -sa terminal-features ',xterm-256-colors:RGB'
      '';
      plugins = [
        {
          plugin = pkgs.tmuxPlugins.gruvbox;
          extraConfig = "set -g @tmux-gruvbox 'dark'";
        }
      ];
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
          clone() {
            REPO_URL=$1
            REPO_BASE=$(basename $REPO_URL)
            REPO_PATH="$\{REPO_BASE%.*\}"
            pushd $HOME/src
            git clone $REPO_URL
            popd
            ${pkgs.tmuxinator} start project $HOME/src/$REPO_PATH
          }

          eval "$(direnv hook zsh)"
          eval "$(zoxide init zsh)"
        '';
      history.extended = true;
      initExtra = ''
        source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
      '';
      shellAliases = {
        "cat" = "${pkgs.bat}/bin/bat";
        "muxs" = "${pkgs.tmuxinator}/bin/tmuxinator start";
        "p" = "${pkgs.tmuxinator}/bin/tmuxinator start project";
        ",gp" = "gopass show -c ";
        "g" = "git";
        "ls" = "eza --long --git";
        "tree" = "eza --tree";
        ",c" = "${pkgs.git}/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME";
        ",t" = "${pkgs.todoist}/bin/todoist --header --color --indent";
        "m" = "${pkgs.gnumake}/bin/make";
        "cd" = "z";
      };
      sessionVariables = {
        TODOIST_API_KEY = "$(${pkgs.gopass}/bin/gopass show -o websites/todoist.com/api_token)";
      };
    };
  };
}
