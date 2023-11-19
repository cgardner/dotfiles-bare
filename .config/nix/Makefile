
.DEFAULT_GOAL := check

check:
	darwin-rebuild check -I "darwin-config=./darwin-configuration.nix"

switch: check
	darwin-rebuild switch -I "darwin-config=./darwin-configuration.nix"

clean:
	rm result
