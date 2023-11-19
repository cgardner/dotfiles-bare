1. Install [Nix](https://nix.dev/install-nix)
2. Install [Nix-darwin](https://github.com/LnL7/nix-darwin/#installing)
3. Install [Home Manager](https://nix-community.github.io/home-manager/index.html#sec-install-nix-darwin-module)
4. Run the following command
    ```bash
    darwin-rebuild switch -I "darwin-config=$HOME/.config/nix/darwin-configuration.nix"
    ```
