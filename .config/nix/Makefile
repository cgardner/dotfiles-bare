.DEFAULT_GOAL := check

.PHONY: check
check: 
	darwin-rebuild check -I "darwin-config=./darwin-configuration.nix" 

.PHONY: switch
switch: COMMAND = switch
switch: exec

.PHONY: build
build: COMMAND = build
build: exec


exec: check
	darwin-rebuild ${COMMAND} -I "darwin-config=./darwin-configuration.nix" 

.PHONY: clean
clean:
	rm result

.PHONY: install-nix
install-nix:
	@curl -L https://nixos.org/nix/install | sh -s -- --daemon


.PHONY: install-nix-darwin
install-nix-darwin:
	nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer 
	./result/bin/darwin-installer

.PHONY: install
install: install-nix install-nix-darwin switch

.PHONY: update
update:
	sudo -i sh -c 'nix-channel --update && nix-env --install --attr nixpkgs.nix && launchctl remove org.nixos.nix-daemon && launchctl load /Library/LaunchDaemons/org.nixos.nix-daemon.plist'


