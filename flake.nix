{
  description = "NixOS System Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    blink-cmp.url = "github:Saghen/blink.cmp";

    stm32cubeide.url = "git+https://git.sr.ht/~shelvacu/stm32cubeide-nix";

  };

  outputs =
    {
      self,
      home-manager,
      nixpkgs,
      stm32cubeide,
      #  nix-matlab,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

    in
    {
      nixosConfigurations."codtop" =
        let
          specialArgs = inputs;
          modules = [
            ./nixos.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.extraSpecialArgs = inputs;
              home-manager.users.yozawa = import ./home-manager.nix;
            }
          ];
        in
        nixpkgs.lib.nixosSystem { inherit system specialArgs modules; };

      formatter."${system}" = nixpkgs.legacyPackages.${system}.nixfmt-rfc-style;
    };
}
