{pkgs, lib, config, ...}: {
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$username[@](#${config.colorScheme.palette.base04})$hostname [visiting](#${config.colorScheme.palette.base0B}) $directory $all $line_break[$status](bold)$character ";
    right_format = "$cmd_duration | $memory_usage | $battery ";

    battery.display = [
      {
        threshold = 20;
        style = "bold #${config.colorScheme.palette.base0F}";
        discharging_symbol = " ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 30;
        style = "bold #${config.colorScheme.palette.base0E}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 80;
        style = "bold #${config.colorScheme.palette.base0B}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 100;
        style = "bold #${config.colorScheme.palette.base0B}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }
    ];

    character = {
      # success_symbol = "[>\]\)====>](bold green)";
      success_symbol = "[bee status: :\\)](bold #${config.colorScheme.palette.base0E})";
      # error_symbol = "[XXXXXXX](bold red)";
      error_symbol = "[bee status: :\\(](bold #${config.colorScheme.palette.base0F})";
    };

    cmd_duration = {
      show_milliseconds = true;
      format = "[$duration]($style)";
      style = "bold #${config.colorScheme.palette.base0E}";
    };

    hostname = {
      ssh_only = false;
      disabled = false;
      style = "bold #${config.colorScheme.palette.base0D}";
      format = "[$ssh_symbol$hostname]($style)";
    };

    username = {
      show_always = true;
      style_root = "bold #${config.colorScheme.palette.base02}";
      style_user = "bold #${config.colorScheme.palette.base05}";
      format = "[$user]($style)";
    };

    memory_usage = {
      disabled = false;
      threshold = -1;
      symbol = " ";
      format = "[$symbol $ram_pct]($style) ";
      style = "bold #${config.colorScheme.palette.base0C}";
    };

    shell = {
      fish_indicator = "";
      zsh_indicator = "";
    };

    status = {
      map_symbol = true;
      pipestatus = true;
      disabled = false;
    };

    time = {
      disabled = false;
      style = "#${config.colorScheme.palette.base0C}";
      format = "[$user]($style)";
    };

    directory = {
      read_only = " ";
      format = "[$path]($style)[$read_only]($read_only_style)";
      style = "bold #${config.colorScheme.palette.base09}";
    };

    aws.symbol = "  ";
    conda.symbol = " ";
    dart.symbol = " ";
    docker_context.symbol = " ";
    elixir.symbol = " ";
    elm.symbol = " ";
    git_branch.symbol = " ";
    golang.symbol = " ";
    hg_branch.symbol = " ";
    java.symbol = " ";
    julia.symbol = " ";
    nim.symbol = " ";
    nix_shell.symbol = " ";
    package.symbol = " ";
    perl.symbol = " ";
    php.symbol = " ";
    python.symbol = " ";
    ruby.symbol = " ";
    rust.symbol = " ";
    scala.symbol = " ";
    swift.symbol = "ﯣ ";

  };

}
