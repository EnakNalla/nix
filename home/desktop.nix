{pkgs, ...}: {
  xdg.desktopEntries = {
    android = {
      name = "Android Studio";
      genericName = "IDE";
      terminal = false;
      categories = ["Development"];
      # nix wants the $ to be escaped (\\$) but then outputs \$ instead of $ in the .desktop file
      exec = "LD_LIBRARY_PATH=\"${pkgs.wayland}/lib/:\\$LD_LIBRARY_PATH\" ${pkgs.androidStudioPackages.dev}/bin/android-studio-dev";
    };
  };
}
