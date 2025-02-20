{ config, ... }: {
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$username[@](${config.lib.stylix.colors.withHashtag.base0D})$hostname [visiting](${config.lib.stylix.colors.withHashtag.base0B}) $directory $all $line_break[$status](bold)$character ";
    right_format = "$cmd_duration";

    battery.display = [
      {
        threshold = 20;
        style = "bold ${config.lib.stylix.colors.withHashtag.base0F}";
        discharging_symbol = " ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 30;
        style = "bold ${config.lib.stylix.colors.withHashtag.base08}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 80;
        style = "bold ${config.lib.stylix.colors.withHashtag.base0F}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 100;
        style = "bold ${config.lib.stylix.colors.withHashtag.base0F}";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }
    ];

    character = {
      # success_symbol = "[>\]\)====>](bold green)";
      success_symbol = "[bee status: :\\)](bold ${config.lib.stylix.colors.withHashtag.base08})";
      # error_symbol = "[XXXXXXX](bold red)";
      error_symbol = "[bee status: :\\(](bold ${config.lib.stylix.colors.withHashtag.base0F})";
    };

    cmd_duration = {
      show_milliseconds = true;
      format = "[$duration]($style)";
      style = "bold ${config.lib.stylix.colors.withHashtag.base08}";
    };

    hostname = {
      ssh_only = false;
      disabled = false;
      style = "bold ${config.lib.stylix.colors.withHashtag.base03}";
      format = "[$ssh_symbol$hostname]($style)";
    };

    username = {
      show_always = true;
      style_root = "bold ${config.lib.stylix.colors.withHashtag.base07}";
      style_user = "bold ${config.lib.stylix.colors.withHashtag.base05}";
      format = "[$user]($style)";
    };

    memory_usage = {
      disabled = false;
      threshold = -1;
      symbol = " ";
      format = "[$symbol $ram_pct]($style) ";
      style = "bold ${config.lib.stylix.colors.withHashtag.base0C}";
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
