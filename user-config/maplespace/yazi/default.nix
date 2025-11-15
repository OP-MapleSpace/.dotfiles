{
  programs.yazi = {
    enable = true;
    keymap = {
      mrg.prepend_keycap = [
        { run = [ "create" "open" ] ; on = "A"; desc = "create then open"; }
        { run = "cd ~/.dotfiles"; on = [ "g" "." ]; desc = "Go ~/.dotfiles (.df)"; }

        { run = "cd ~/.dotfiles/flake-config"; on = [ "g" "." "f" ]; desc = "Go .df/flake-config"; }
        { run = "cd ~/.dotfiles/system-config/MapleWorld"; on = [ "g" "." "s" ]; desc = "Go .df/system-config/MapleWorld"; }
        { run = "cd ~/.dotfiles/user-config/maplespace"; on = [ "g" "." "u" ]; desc = "Go .df/user-config/maplespace"; }

        { run = "cd ~/Documents"; on = [ "g" "D" ]; desc = "Go ~/Documents"; }
        { run = "cd ~/Downloads"; on = [ "g" "d" ]; desc = "Go ~/Downloads"; }

        { run = "cd ~/Sync"; on = [ "g" "s" ]; desc = "Go ~/Sync (S)"; }
        { run = "cd ~/Sync/Documents"; on = [ "g" "s" "d" ]; desc = "Go S/Documents"; }
        { run = "cd ~/Sync/Music"; on = [ "g" "m" ]; desc = "Go S/Music"; }
        { run = "cd ~/Sync/Pictures"; on = [ "g" "p" ]; desc = "Go S/Pictures"; }
        { run = "cd ~/Sync/Videos"; on = [ "g" "v" ]; desc = "Go S/Videos"; }

        { run = "cd ~/.trash"; on = [ "g" "t" ]; desc = "Go ~/.trash"; }
      ];
    };
    settings = {
      mgr = {
        show_hidden = true;
        show_symlink = true;
        linemode = "permissions";
      };
    };
  };
}

