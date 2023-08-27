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
	printf "\n\nYou have now entered the \033[38;5;046msolar system\033[38;5;073m!\033[38;5;051m\nStar:\033[38;5;226m Alpha Hlynur Solare\n\n\033[38;5;196mThis is a space with endless possibilities... \n\033[38;5;201mA space where there is no right or wrong...\n\033[38;5;046mGo explore this wonderful system...\n\033[38;5;051m...And of course, have fun :)\n\n\033[38;5;033mBefore we depart on our journey...\n...let's hear from the Cow of Wisdom:\n"
	echo | fortune | cowsay | lolcat
	printf "\033[38;5;033m\n= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = /\n"
      '';
    };
  
  };
}
