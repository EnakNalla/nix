{vars, ...}: {
  imports = [./theme.nix] ++ (import ./programs);

  home = {
    username = vars.user;
    homeDirectory = "/home/${vars.user}";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}
