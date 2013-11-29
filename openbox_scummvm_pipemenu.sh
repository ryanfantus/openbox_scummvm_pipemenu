#!/bin/bash
#       openbox_scummvm_pipemenu.sh
#       initially created 2013 - Ryan Fantus
#
# assumes your scummvmrc file is ~/.scummvmrc and your scummvm launcher is /usr/local/bin/scummvm
# I noticed a bug with unescaped ampersands (&) cropping up in Sam & Max, so I replaced it with "and".

scumm_launcher=/usr/local/bin/scummvm
scumm_rc=~/.scummvmrc

function generate_scummvm_menu {

  while read line
  do
        if [[ $line == "["* ]]; then                    # test for an open bracket, see ~/.scummvmrc for why
                if [[ $line != "[scummvm]" ]]; then     # but skip the [scummvm] bracket
                        scumm_description=''            # and here make sure we find [game] followed by
                        while [[ $scumm_description != "description"* ]]; do    # description= text
                                read scumm_description
                        done
                        echo -n '<item label="'
                        echo -n $scumm_description | sed s/'description='/\/g | tr -d '\"' | sed s/'&'/'and'\/g
                        echo '">'
                        echo -n '<action name="Execute"><execute>'
                        echo -n "$scumm_launcher '${line}'" | tr -d "[]"
                        echo '</execute></action>'
                        echo '</item>'
                fi
        fi
  done < $scumm_rc

}

echo '<openbox_pipe_menu>'

# First, we'll create a launcher specifically for ScummVM

echo '<item label="ScummVM">'
echo -n '<action name="Execute"><execute>'
echo -n "$scumm_launcher"
echo '</execute></action>'
echo '</item>'
echo '<separator/>'

generate_scummvm_menu

echo '</openbox_pipe_menu>'
