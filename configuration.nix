{ config, pkgs, ... }:

let
	group = config.users.users.${config.username}.group or "users";
	home = config.users.users.${config.username}.home;
in {
	system.activationScripts.fastfetch = ''
		mkdir -p ${home}/.config
		chown ${config.username}:${group} ${home}/.config
		chmod 700 ${home}/.config

		rm -rf ${home}/.config/fastfetch
		mkdir ${home}/.config/fastfetch
		chown ${config.username}:${group} ${home}/.config/fastfetch
		chmod 700 ${home}/.config/fastfetch

		cp ${./config.jsonc} ${home}/.config/fastfetch/config.jsonc
		chown ${config.username}:${group} ${home}/.config/fastfetch/config.jsonc
		chmod 600 ${home}/.config/fastfetch/config.jsonc

	'';
	
	environment.systemPackages = with pkgs; [
		fastfetch
	];
}
