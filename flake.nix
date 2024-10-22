{
  description = "Enak's Flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions?ref=master";

    alejandra = {
      url = "github:kamadorueda/alejandra/3.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
  };

  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    vars = {
      user = "enak";
      terminal = "alacritty";
      flake = "/home/enak/nix";
    };
  in {
    nixosConfigurations = (
      import ./hosts {
        inherit (nixpkgs) lib;
        inherit vars inputs nixpkgs;
      }
    );

    darwinConfigurations = (
      import ./darwin {
        inherit (nixpkgs) lib;
        inherit vars inputs nixpkgs;
      }
    );
  };
}
