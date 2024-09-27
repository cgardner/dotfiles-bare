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
        (${pkgs.zoxide}/bin/zoxide init nushell | ignore)
        (${pkgs.starship}/bin/starship init nu | ignore)
        (${pkgs.carapace}/bin/carapace _carapace nushell | ignore)

        $env.PATH = ($env.PATH | split row (char esep) | prepend [/run/current-system/sw/bin /usr/bin/env /opt/homebrew/bin /usr/local/bin] | uniq -i | str join (char esep))
        def _c [...args] {
          ${pkgs.git}/bin/git --git-dir=($env.HOME)/.cfg --work-tree=($env.HOME) ...$args
        }

        def clone [repository] {
          let repo_dirname = ($repository | path parse | get stem)
          ${pkgs.git}/bin/git clone ($repository) ([$env.HOME, 'src', $repo_dirname] | str join "/")
          ${pkgs.tmuxinator}/bin/tmuxinator start project ($repo_dirname)
        }
      '';
      environmentVariables = {
        "EDITOR" = "${pkgs.neovim}/bin/nvim";
        "JAVA_HOME" = "${pkgs.temurin-bin-17}/";
      };
      shellAliases = {
        "cat" = "${pkgs.bat}/bin/bat";
        "muxs" = "${pkgs.tmuxinator}/bin/tmuxinator start";
        "p" = "${pkgs.tmuxinator}/bin/tmuxinator start project";
        ",gp" = "${pkgs.gopass}/bin/gopass show -c ";
        ",g" = "${pkgs.git}/bin/git";
        "ll" = "${pkgs.eza}/bin/eza --icons --long --git";
        "tree" = "${pkgs.eza}/bin/eza --icons --tree";
        ",c" = "${pkgs.git}/bin/git --git-dir=($env.HOME)/.cfg --work-tree=($env.HOME)";
        "m" = "${pkgs.gnumake}/bin/make";
        "cd" = "z";
      };
    };
  };
}
