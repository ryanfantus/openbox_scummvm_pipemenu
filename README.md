openbox_scummvm_pipemenu
========================

This is an openbox pipemenu to parse your .scummvmrc file into an actual menu with game launchers

Throw this into a public place (/usr/local/bin) or a private place, preferably in your $PATH (~/bin).  For public use, chmod a+x the script, for private use, chmod u+x the script.

Next, open your openbox menu.xml (~/.config/openbox/menu.xml) and add this where you'd like your pipemenu:

<menu execute="<path/to/the/script>/openbox_scummvm_pipemenu.sh" id="scummvmmenu" label="ScummVM"/>

Then, openbox --reconfigure and enjoy :)
