{
    programs.nixvim = {

        globals.mapleader = ";"; # Sets Leader Key

        keymaps = [
            {
                mode = ["n" "i" "v"];
                key = "<M-Right>";
                action = "<esc> 'l' 'i'";
                options = {expr = true; silent = true; remap = true;};
            }
        ];
    };
}
