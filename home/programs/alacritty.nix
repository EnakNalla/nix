let
  colours = import ../../utils/colours.nix;
in {
  programs.alacritty = with colours.hex; {
    enable = true;
    settings = {
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        bold = {style = "Bold";};
        italic = {style = "Italic";};
        size = 14;
      };

      cursor.style = {
        shape = "Beam";
      };

      cursor.vi_mode_style = {
        blinking = "Off";
        shape = "Block";
      };

      window = {
        decorations = "Full";
        dynamic_title = true;
        dynamic_padding = true;
      };

      env = {
        TERM = "xterm-256color";
      };

      selection = {
        save_to_clipboard = true;
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
      };

      colors.primary = {
        background = "${bg}";
        foreground = "${fg}";
        bright_foreground = "#ffffff";
      };
      colors.cursor = {
        text = "#282a36";
        cursor = "#f8f8f2";
      };
      colors.vi_mode_cursor = {
        text = "CellBackground";
        cursor = "CellForeground";
      };
      colors.selection = {
        text = "CellForeground";
        background = "${currentLine}";
      };
      colors.normal = {
        black = "${bg}";
        red = "${red}";
        green = "${green}";
        yellow = "${yellow}";
        blue = "${purple}";
        magenta = "${pink}";
        cyan = "${cyan}";
        white = "${fg}";
      };
      colors.search.matches = {
        foreground = "${currentLine}";
        background = "${green}";
      };
      colors.search.focused_match = {
        foreground = "${currentLine}";
        background = "${yellow}";
      };
      colors.footer_bar = {
        background = "${bg}";
        foreground = "${fg}";
      };
      colors.hints.start = {
        foreground = "${bg}";
        background = "${yellow}";
      };
      colors.hints.end = {
        foreground = "${bg}";
        background = "${green}";
      };
    };
  };
}
