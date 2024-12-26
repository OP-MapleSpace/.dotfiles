{
  programs.nixvim = {
    clipboard = {
      providers.wl-copy.enable = true;
	  register = "unnamedplus";
    };

    opts = {
      encoding = "utf-8"; # UTF-8 Encoding
      mouse = "a"; # Enable Mouse
      list = true; # Enable List

      # Indents
	  expandtab = true;
      tabstop = 8;
      shiftwidth = 2;
      softtabstop = 4;
      autoindent = true;
      smartindent = true;

      # Smooth scrolling
      smoothscroll= true;

      # Case Handling
      ignorecase = true;
      smartcase = true;

      cmdheight = 1; # Command Line Height

      # Timeouts
      tm = 500;

      hidden = true; # Enable Hidden Buffers

      # Split Config
      splitbelow = true;
      splitright = true;

      # Sign Column Config
      signcolumn = "yes";
      number = true;
      relativenumber = true;

      # Syntax Highlighting
      syntax = "on";
      filetype = "on";
      termguicolors = true;
    };
  };
}
