
.DEFAULT_GOAL := check

.PHONY: check
check:
	darwin-rebuild check -I "darwin-config=./darwin-configuration.nix"


.PHONY: switch
switch: check
	darwin-rebuild switch -I "darwin-config=./darwin-configuration.nix"

.PHONY: clean
clean:
	rm result

.PHONY: install-nix
install-nix:
	@curl -L https://nixos.org/nix/install | sh -s -- --daemon
.PHONY: install
install: install-nix switch

.PHONY: update
update:
	sudo -i sh -c 'nix-channel --update && nix-env --install --attr nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'


