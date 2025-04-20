# nixos-fastfetch

nixos-fastfetch = fetchGit {
	url = "https://github.com/typovrak/nixos-fastfetch.git";
	ref = "main";
};

(import "${nixos-fastfetch}/configuration.nix")
