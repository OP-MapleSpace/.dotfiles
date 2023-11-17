{pkgs, lib, ...}: {
  programs.starship.enable = true;
  programs.starship.enableFishIntegration = true;
  programs.starship.settings = {
    add_newline = false;
    format = "$username[@](#008cff)$hostname [visiting](#00ffff) $directory [<<](#ff00ff)[<](bold #5900bf)[<<](bold #3000bf) [status:](#3821ff) $memory_usage[| ](#2194ff)$battery$all[| ](#2194ff)$time[:end](#3821ff) [>>](#3000bf)[>](bold #5900bf)[>>](#ff00ff)$line_break[$status](bold)$character ";
    right_format = "$cmd_duration";
    
    battery.display = [
      {
        threshold = 20;
	style = "bold red";
        discharging_symbol = " ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 30;
        style = "bold yellow";
        discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 80;
	style = "bold green";
	discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }

      {
        threshold = 100;
	style = "bold green";
	discharging_symbol = "  ";
        charging_symbol = "⚡️ ";
      }
    ];

    character = {
      # success_symbol = "[>\]\)====>](bold green)";
      success_symbol = "[bee status: :\\)](bold yellow)";
      # error_symbol = "[XXXXXXX](bold red)";
      error_symbol = "[bee status: :\\(](bold red)";
    };

    cmd_duration = {
      show_milliseconds = true;
      format = "[$duration]($style)";
      style = "bold green";
    };

    hostname = {
      ssh_only = false;
      disabled = false;
      style = "bold #0044ff";
      format = "[$ssh_symbol$hostname]($style)";
    };

    username = {
      show_always = true;
      style_root = "bold #0000ff";
      style_user = "bold #008cff";
      format = "[$user]($style)";
    };

    memory_usage = {
      disabled = false;
      threshold = -1;
      symbol = " ";
      format = "[$symbol $ram_pct]($style) ";
      style = "bold dimmed #2194ff";
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
      style = "#2194ff";
      format = "[$user]($style)";
    };

    directory = {
      read_only = " ";
      format = "[$path]($style)[$read_only]($read_only_style)";
      style = "bold green";
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
