{pkgs, lib, ...}: 
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
	printf "\n\nYou have now entered the \033[38;5;046mMapleWorld\033[38;5;073m!\033[38;5;051m\nParent Star:\033[38;5;226m Alpha Hlynur Solare\n\n\033[38;5;196mWelcome to a radical new experience... \n\033[38;5;201mWhere creativity and uniqueness thrive...\n\033[38;5;046mWhen exploration is the Law of the Land...\n\033[38;5;051m...Enjoy your stay in the MapleWorld! :)\n\n\033[38;5;033m- - - - - - - - - - - |\n\n\033[38;5;123mHere's \033[38;5;159myour \033[38;5;225mfortune \033[38;5;219muwu:\n"
	echo | fortune | cowsay | lolcat
	printf "\033[38;5;033m\n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = /\n"
      '';
    };

    shellAbbrs = {
      upnch = "sudo nix-channel --update && sudo nix flake update";
      upnco = "sudo nixos-rebuild switch --flake .#MapleWorld";
      upnte = "sudo nixos-rebuild test --flake .#MapleWorld";
      upnrb = "sudo nixos-rebuild switch --flake .#MapleWorld --rollback";
    };

  };
}
