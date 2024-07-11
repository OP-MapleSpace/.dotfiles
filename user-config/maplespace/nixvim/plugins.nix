{ pkgs, ... }:

{
  # colorschemes.ron.enable = true; # Colorscheme Ron
  programs.nixvim = {
    plugins = {
    ## Linting, Syntax, Autopairing, Autocomplete, etc. ##
      ts-autotag.enable = true; # Autotag
      nvim-autopairs.enable = true; # Autopair

      # Snippets + Autocompletion
      luasnip = {
        enable = true;
        extraConfig = {
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
            "<cr>" = "cmp.mapping.confirm({ select = true })";
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
          #fish_lsp.enable = true; # Fish shell
          gdscript.enable = true; # GDScript (Godot)
          gopls.enable = true; # GO
          #gradle_ls.enable = true; # Gradle (Java)
          html.enable = true; # HTML
          java-language-server.enable = true; # Java
          julials.enable = true; # Julia
          kotlin-language-server.enable = true; # Kotlin
          lua-ls.enable = true; # Lua
          #matlab_ls.enable = true; # MATLAB
          nil-ls.enable = true; # Nix
          pyright.enable = true; # Python
          #qml-lsp.enable = true; # QML
          r-language-server.enable = true; # R
          ruff-lsp.enable = true; # Rust for Python(?)
          rust-analyzer = { # Rust
            enable = true;
            installRustc = true;
            installCargo = true;
          };
          sqls.enable = true; # SQL
          svelte.enable = true; # Svelte JS
          taplo.enable = true; # TOML
          tailwindcss.enable = true; # Tailwind CSS
          texlab.enable = true; # LaTeX
          tsserver.enable = true; # TypeScript
          typos-lsp.enable = true; # Spelling
          vuels.enable = true; # Vue JS
          yamlls.enable = true; # YAML
        };
        keymaps.lspBuf = {
          "gd" = "definition";
          "gr" = "references";
          "gt" = "type_definition";
          "gi" = "implementation";
          "k" = "hover";
        };
      };
      lsp-lines = {
        enable = true;
        #currentLine = true;
      };
      rust-tools.enable = true;
      none-ls.enable = true;

      # treesitter config
      treesitter = {
        enable = true;
        ensureInstalled = [
          "astro"
          "html"
          "java"
          "javascript"
          "lua"
          "nix"
          "python"
          "rust"
        ];
        folding = false;
        indent = true;
        nixGrammars = true;
        nixvimInjections = true;
      };

      ## Programming Stuff ##
      # Markdown
      markdown-preview = {
        enable = true;
        settings = {
          browser = "firefox";
          echo_preview_url = true;
          port = "8129";
          theme = "dark";
        };
      };
      headlines.enable = true; # Markdown Headline Highlighter

      # Git
      fugitive.enable = true;
      gitgutter.enable = true;

      fzf-lua.enable = true; # fzf (fuzzy search)

      ## Theming ##
      chadtree.enable = true; # File tree tab on the left
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
