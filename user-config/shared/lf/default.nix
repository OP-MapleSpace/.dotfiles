{
  programs.lf = {
    enable = true;
    commands = {
      trash = "%set -f; mv -t ~/.trash $fx";
      extract = ''
        ''${{
          set -f
          case $f in
            *.tar.bz|*.tar.bz2|*.tbz|*.tbz2) tar xjvf $f;;
            *.tar.gz|*.tgz) tar xzvf $f;;
            *.tar.xz|*.txz) tar xJvf $f;;
            *.zip) unzip $f;;
            *.rar) unrar x $f;;
            *.7z) 7z x $f;;
          esac
        }}
      '';
      zip = ''
        ''${{
          set -f
          mkdir $1
          cp -r $fx $1
          zip -r $1.zip $1
          rm -rf $1
        }}
      '';
    };
    keybindings = {
      # Files
      "." = "set hidden!";
      a = ":push %touch<space>";
      A = ":push %mkdir<space>";
      e = "\$$f";
      E = "!$f";
      n = ":push %nvim<space>";
      U = "clear";
      S = "!du -sh"; # File Size
      x = "cut";
      zx = "extract";
      zz = "zip";

      # Open Files
      oo = "open";
      oe = "\$$EDITOR \"$f\"";
      oi = "\$$PAGER \"$f\"";
      os = "\$$SHELL \"$f\"";

      # Trash
      D = "trash";
      "<backspace>" = "trash";
      "<backspace2>" = "trash";
      d = "delete";
      "<delete>" = "delete";

      # Locations
      gh = "cd ~";
      gdf = "cd ~/.dotfiles";
      gdl = "cd ~/Downloads";
      gdc = "cd ~/Documents";
      gf = "cd ~/.dotfiles/flake-config/";
      gm = "cd ~/Sync/Music";
      gp = "cd ~/Sync/Pictures";
      gS = "cd ~/Sync";
      gsd = "cd ~/Sync/Documents/";
      gt = "cd ~/.trash";
      gv = "cd ~/Sync/Videos";
    };
    settings = {
      hidden = "true";
      number = "true";
      tabstop = 4;
      ignorecase = "true";
      icons = "true";
    };
  };
}
