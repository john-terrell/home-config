{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: let
        inherit (self) outputs;
    in {
        overlays = import ./overlays { inherit inputs outputs; };

        homeConfigurations = {
            "johnt@macstudio-vm" = home-manager.lib.homeManagerConfiguration {
                pkgs = nixpkgs.legacyPackages."aarch64-linux";
                extraSpecialArgs = {
                    inherit inputs outputs;
                    systemConfig = {};
                };
                modules = [
                    nixvim.homeManagerModules.nixvim
                        ./users/johnt
                        ./users/johnt/profiles/desktop.nix
                ];
            };
        };
    };
}
