{ config, pkgs, lib, ... }:
{
  programs = {
    nushell = {
      enable = true;
      extraConfig = ''
        $env.config = {
          show_banner: false,
          edit_mode: "vi",
          completions: {
            case_sensitive: false # case-sensitive completions
            quick: true    # set to false to prevent auto-selecting completions
            partial: true    # set to false to prevent partial filling of the prompt
            algorithm: "fuzzy"    # prefix or fuzzy
            external: {
              # set to false to prevent nushell looking into $env.PATH to find more suggestions
              enable: true
              # set to lower can improve completion performance at the cost of omitting some options
              max_results: 100
            }
          },
          keybindings: [
            {
              name: "CancelCurrentLine",
              modifier: control,
              keycode: char_u,
              event: {send: "CtrlC"},
              mode: [vi_insert, vi_normal],
            },
          ],
        }
        $env.CARAPACE_BRIDGES = "zsh,fish,bash,inshellisense"
        $env.PATH = ($env.PATH | split row (char esep) | append [/usr/bin/env /opt/homebrew/bin /run/current-system/sw/bin /usr/local/bin])
        (${pkgs.zoxide}/bin/zoxide init nushell | ignore)
        (${pkgs.starship}/bin/starship init nu | ignore)
        (${pkgs.carapace}/bin/carapace _carapace nushell | ignore)

        def _c [...args] {
          ${pkgs.git}/bin/git --git-dir=($env.HOME)/.cfg --work-tree=($env.HOME) ...$args
        }
      '';
      environmentVariables = {
        "EDITOR" = "${pkgs.neovim}/bin/nvim";
        "JAVA_HOME" = "${pkgs.temurin-bin-17}/";
      };
      shellAliases = {
        "cat" = "${pkgs.bat}/bin/bat";
        "muxs" = "tmuxinator start";
        "p" = "tmuxinator start project";
        ",gp" = "${pkgs.gopass}/bin/gopass show -c ";
        # "g" = "${pkgs.git}/bin/git";
        "ll" = "${pkgs.eza}/bin/eza --icons --long --git";
        "tree" = "${pkgs.eza}/bin/eza --icons --tree";
        # ",c" = "_c";
        ",c" = "${pkgs.git}/bin/git --git-dir=($env.HOME)/.cfg --work-tree=($env.HOME)";
        "m" = "${pkgs.gnumake}/bin/make";
        "cd" = "z";
      };
    };
  };
}
