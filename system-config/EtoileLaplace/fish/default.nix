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
	printf "\n\nYou have now entered the \033[38;5;046msolar system\033[38;5;073m!\033[38;5;051m\nStar:\033[38;5;226m Étoile Laplace\n\n\033[38;5;196mThis is a space with endless possibilities... \n\033[38;5;201mA space where there is no right or wrong...\n\033[38;5;046mGo explore this wonderful system...\n\033[38;5;051m...And of course, have fun :)\n\n\033[38;5;033m- - - - - - - - - - - |\n\n\033[38;5;123mHere's \033[38;5;159myour \033[38;5;225mfortune \033[38;5;219muwu:\n"
	echo | fortune | cowsay | lolcat
	printf "\033[38;5;033m\n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = /\n"
      '';
    };

    shellAbbrs = {
      upnch = "sudo nix-channel --update && sudo nix flake update";
      upnco = "sudo nixos-rebuild switch --flake .#EtoileLaplace";
      upnte = "sudo nixos-rebuild test --flake .#EtoileLaplace";
      upnrb = "sudo nixos-rebuild switch --flake .#EtoileLaplace --rollback";

      nvflk = "nvim ~/.dotfiles/flake-config/flake.nix";
      nvhmd = "nvim ~/.dotfiles/user-config/d/home.nix";
      nvpkgd = "nvim ~/.dotfiles/user-config/d/packages.nix";
      nvpyd = "nvim ~/.dotfiles/user-config/d/python.nix";
      nvhml = "nvim ~/.dotfiles/user-config/l/home.nix";
      nvpkgl = "nvim ~/.dotfiles/user-config/l/packages.nix";
      nvpyl = "nvim ~/.dotfiles/user-config/l/python.nix";
      nvcf = "nvim ~/.dotfiles/system-config/EtoileLaplace/configuration.nix";
      nvhcf = "nvim ~/.dotfiles/system-config/EtoileLaplace/hardware-configuration.nix";
      nvinit = "nvim ~/.dotfiles/user-config/l/neovim/init.lua";

      restart = "systemctl reboot";

      pymov = "nix-shell ~/.dotfiles/python-env/py-mov-cli/shell.nix --command 'fish'";
    };

  };
}
