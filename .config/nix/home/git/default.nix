{configs, pkgs, ...}:
{
  programs.git = {

    aliases = {
      a = "add -p";
      assume = "update-index --assume-unchanged";
      b = "branch";
      ci = "commit -v";
      co = "checkout";
      st = "status -sb";
      unassume = "update-index --no-assume-unchanged";
      conflicted = "diff --name-only --diff-filter=U";
      today = "log --since=\"1 am\" --author=\"Craig Gardner\" --pretty=format:\"%h (%ar) - %s\" --no-merges";
    };

    enable = true;

    hooks = {
    };

    ignores = [
      ".DS_Store"
      "*.swp"
    ];

    userName = "Craig Gardner";
    userEmail = "craig.s.gardner@proton.me";

    signing = {
      key = "6AABA3DF87907C67A7D71B858C7FA3A46B541696";
      signByDefault = false;
    };
  };
}
