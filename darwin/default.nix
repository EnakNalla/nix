{
  inputs,
  nixpkgs,
  vars,
  ...
}: let
  system = "aarch64-darwin";

  systemConfig = {
    system = system;
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };

  lib = nixpkgs.lib;
in {
  default = let
    inherit systemConfig system;
  in
    lib.darwin.lib.darwinSystem {
      inherit system;

      specialArgs = {
        inherit inputs vars nixpkgs;
      };

      modules = [
        ./configuration.nix

        inputs.nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            enable = true;
            enableRosetta = true;
            user = "${vars.user}";
            autoMigrate = true;
          };
        }

        inputs.home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = {
            inherit inputs vars;
          };
          home-manager.users.${vars.user} = import ../home;
        }
      ];
    };
}
