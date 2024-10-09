{pkgs, ...}: {
  home = {
    file.".config/wall.png".source = ../assets/wall.png;

    pointerCursor = {
      gtk.enable = true;
      name = "Dracula-cursors";
      package = pkgs.dracula-theme;
      size = 26;
    };
  };
}
