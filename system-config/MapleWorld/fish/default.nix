{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      eval (starship init fish)
    '';

    functions = {
      fish_greeting = ''
        # fortune
	set fortuneMessage (fortune)
	
	# Output it to the console
	printf "\033[38;5;033m= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = \\"
	printf "\n\nYou have now entered the \033[38;5;046mMapleWorld\033[38;5;073m!\033[38;5;051m\nParent Star:\033[38;5;226m l'Étoile Laplace\n\n\033[38;5;196mWelcome to a radical new experience... \n\033[38;5;201mWhere creativity and uniqueness thrive...\n\033[38;5;046mWhen exploration is the Law of the Land...\n\033[38;5;051m...Enjoy your stay in the MapleWorld! :)\n\n\033[38;5;033m- - - - - - - - - - - |\n\n\033[38;5;123mHere's \033[38;5;159myour \033[38;5;225mfortune \033[38;5;219muwu:\n"
	echo | fortune | cowsay | lolcat
	printf "\033[38;5;033m\n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = /\n"
      '';
    };

    shellAbbrs = {
      upnch = "sudo nix-channel --update && sudo nix flake update";
      upnco = "sudo nixos-rebuild switch --flake .#MapleWorld";
      upnte = "sudo nixos-rebuild test --flake .#MapleWorld";
      upnrb = "sudo nixos-rebuild switch --flake .#MapleWorld --rollback";

      nvflk = "nvim ~/.dotfiles/flake-config/flake.nix";
      nvhm = "nvim ~/.dotfiles/user-config/maplespace/home.nix";
      nvpkg = "nvim ~/.dotfiles/user-config/maplespace/packages.nix";
      nvpy = "nvim ~/.dotfiles/user-config/maplespace/python.nix";
      nvcf = "nvim ~/.dotfiles/system-config/MapleWorld/configuration.nix";
      nvhcf = "nvim ~/.dotfiles/system-config/MapleWorld/hardware-configuration.nix";
      nvinit = "nvim ~/.dotfiles/user-config/maplespace/neovim/init.lua";

      pymov = "nix-shell ~/.dotfiles/python-env/py-mov-cli/shell.nix --command 'fish'";

      restart = "systemctl reboot";
      restartfs = "systemctl reboot --firmware-setup";

      starwars = "telnet towel.blinkenlights.nl";
    };

  };
}
