{
  inputs,
  nixpkgs,
  vars,
  ...
}: let
  system = "x86_64-linux";

  lib = inputs.nixpkgs.lib;

  modules =
    [
      inputs.home-manager.nixosModules.home-manager
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = {
          inherit inputs vars;
        };
        home-manager.users.${vars.user} = import ../home;
      }

      ./configuration.nix
    ]
    ++ (import ../modules);

  specialArgs = {
    inherit inputs vars nixpkgs;
    host.hostName = "laptop";
  };
in {
  laptop = lib.nixosSystem {
    inherit system;

    specialArgs = specialArgs;

    modules = [./laptop] ++ modules;
  };
}
