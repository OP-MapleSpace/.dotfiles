{ pkgs, ... }:

{
  # colorschemes.ron.enable = true; # Colorscheme Ron
  programs.nixvim = {
    plugins = {
      ## Icons
      web-devicons.enable = true;
    ## Linting, Syntax, Autopairing, Autocomplete, etc. ##
      ts-autotag.enable = true; # Autotag
      nvim-autopairs.enable = true; # Autopair

      # Snippets + Autocompletion
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<M-s>";
        };
      };
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          mapping = {
            "<M-down>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<M-up>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<M-cr>" = "cmp.mapping.confirm({ select = true })";
            "<C-e>" = "cmp.mapping.close()";
          };
          sources = [
            {name = "buffer";}
            {name = "calc";}
            {name = "clippy";}
            {name = "cmdline";}
            {name = "cmp-cmdline-history";}
            {name = "codeium";}
            {name = "dap";}
            {name = "emoji";}
            {name = "fish";}
            {name = "git";}
            {name = "luasnip";}
            {name = "npm";}
            {name = "nvim_lsp";}
            {name = "path";}
            {name = "rg";}
            {name = "spell";}
            {name = "treesitter";}
          ];
        };
      };
      #codeium-vim.enable = true;
      undotree.enable = true;
      barbar.enable = true; # better tabs

      # lsp config
      lsp = {
        enable = true;
        servers = {
          #arduino_language_server.enable = true; # Arduino
          #angularls.enable = true; # Angular JS
          astro.enable = true; # Astro.js
          bashls.enable = true; # Bash
          clangd.enable = true; # C
          cssls.enable = true; # CSS
          dockerls.enable = true; # Docker
          #gdscript.enable = true; # GDScript (Godot)
          gopls.enable = true; # GO
          #html.enable = true; # HTML
          java_language_server.enable = true; # Java
          #julials.enable = true; # Julia
          kotlin_language_server.enable = true; # Kotlin
          lua_ls.enable = true; # Lua
          nil_ls.enable = true; # Nix
          pyright.enable = true; # Python
          #r_language_server.enable = true; # R
          ruff_lsp.enable = true; # Rust for Python(?)
          rust_analyzer = { # Rust
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          sqls.enable = true; # SQL
          svelte.enable = true; # Svelte JS
          taplo.enable = true; # TOML
          tailwindcss.enable = true; # Tailwind CSS
          texlab.enable = true; # LaTeX
          ts_ls.enable = true; # TypeScript
          typos_lsp.enable = true; # Spelling
          #vuels.enable = true; # Vue JS
          yamlls.enable = true; # YAML
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gr" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "gk" = "hover";
        };
      };
      lsp-lines = {
        enable = true;
      };
      none-ls.enable = true;

      # treesitter config
      treesitter = {
        enable = true;
        folding = false;
        settings = {
          indent.enable = true;
        };
        nixGrammars = true;
        nixvimInjections = true;
      };

      ## Programming Stuff ##
      # Markdown
      markdown-preview = {
        enable = true;
        settings = {
          browser = "firefox";
          echo_preview_url = 1;
          port = "8129";
          theme = "dark";
        };
      };
      headlines.enable = true; # Markdown Headline Highlighter

      # LaTeX Previewer
      vimtex = {
        enable = true;
        settings.view_method = "zathura";
      };

      # Git
      fugitive.enable = true;
      gitgutter.enable = true;

      fzf-lua.enable = true; # fzf (fuzzy search)

      ## Theming ##
      neo-tree.enable = true; # File tree tab on the left
      lualine.enable = true; # Statusline
      # Start UI
      startup = {
        enable = true;
        theme = "Startify";
      };
      noice.enable = true; # Funny command line things
	  
	  ## Other ##
	  neocord.enable = true; # Discord Rich Presence (for the flex, of course)
	  image.enable = true; # image thing
    };

    ## Extras ##
    # Tetris uwu
    extraPlugins = [(pkgs.vimUtils.buildVimPlugin {
      name = "nvim-tetris";
      src = pkgs.fetchFromGitHub {
        owner = "alec-gibson";
        repo = "nvim-tetris";
        rev = "d17c99fb527ada98ffb0212ffc87ccda6fd4f7d9";
        hash = "sha256-+69Fq5aMMzg9nV05rZxlLTFwQmDyN5/5HmuL2SGu9xQ=";
      };
    })];
  };
}
