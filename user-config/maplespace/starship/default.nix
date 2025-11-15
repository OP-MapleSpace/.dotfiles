{ config, ... }: {
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$username[@](#8c00ff)$hostname [visiting](#00ff00) $directory $all $line_break[$status](bold)$character ";
    right_format = "$cmd_duration";

    battery = {
      disabled = true;
      display = [
        {
          threshold = 20;
          style = "bold #ff0000";
          discharging_symbol = " ";
          charging_symbol = "⚡️ ";
        }

        {
          threshold = 30;
          style = "#ffff00";
          discharging_symbol = "  ";
          charging_symbol = "⚡️ ";
        }

        {
          threshold = 80;
          style = "bold #008cff";
          discharging_symbol = "  ";
          charging_symbol = "⚡️ ";
        }

        {
          threshold = 100;
          style = "bold #00ff00";
          discharging_symbol = "  ";
          charging_symbol = "⚡️ ";
        }
      ];
    };

    character = {
      success_symbol = "[bee status: :\\)](bold #ffff00)";
      error_symbol = "[bee status: :\\(](bold #ff0000)";
    };

    cmd_duration = {
      show_milliseconds = true;
      format = "[$duration]($style)";
      style = "bold ${config.lib.stylix.colors.withHashtag.base08}";
    };

    hostname = {
      ssh_only = false;
      disabled = false;
      style = "bold #ff00ff";
      format = "[$ssh_symbol$hostname]($style)";
    };

    username = {
      show_always = true;
      style_root = "bold #0000ff";
      style_user = "bold #008cff";
      format = "[$user]($style)";
    };

    memory_usage = {
      disabled = true;
      threshold = -1;
      symbol = " ";
      format = "[$symbol $ram_pct]($style) ";
      style = "bold ${config.lib.stylix.colors.withHashtag.base0B}";
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
      style = "${config.lib.stylix.colors.withHashtag.base0C}";
      format = "[$user]($style)";
    };

    directory = {
      read_only = " ";
      format = "[$path]($style)[$read_only]($read_only_style)";
      style = "bold ${config.lib.stylix.colors.withHashtag.base0C}";
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
