{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim/nixos-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: let
        inherit (self) outputs;
    in {
        overlays = import ./overlays { inherit inputs outputs; };

        homeConfigurations = {
            "johnt@p620" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };

            "johnt@legion5i" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."x86_64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeModules.nixvim
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
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };
        };
    };
}
