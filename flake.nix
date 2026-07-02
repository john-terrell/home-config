{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-doom-emacs-unstraightened = {
            url = "github:marienz/nix-doom-emacs-unstraightened";
            inputs = {
              # If you use the home-manager module, you can set your doomdir here.
              #
              # If your Doom configuration is in this flake:
              #doomdir.url = "./doom.d";
              # If your Doom configuration is in a different repository:
              doomdir.url = "git+https://github.com/john-terrell/doomdir";
              # Or leave `doomdir` unset and set `programs.doom-emacs.doomDir` in your
              # home-manager configuration (see below).

              # Optional, to download less. Neither the module nor the overlay uses this input.
              nixpkgs.follows = "";
            };
        };
    };

    outputs = { self, nixpkgs, home-manager, nixvim, nix-doom-emacs-unstraightened, ... }@inputs: let
        inherit (self) outputs;
    in {
        overlays = import ./overlays { inherit inputs outputs; };

        homeConfigurations = {

            "johnt@legion5i" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };

            "johnt@xps15" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };

            "johnt@macbookpro" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."aarch64-darwin";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/darwin.nix
                ];
            };

            "johnt@macbookpro-vm" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."aarch64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };

            "johnt@macstudio" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."aarch64-darwin";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/darwin.nix
                ];
            };

            "johnt@macstudio-vm" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."aarch64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                    nix-doom-emacs-unstraightened.homeModule
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };
        };
    };
}
