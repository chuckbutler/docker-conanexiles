#!/bin/bash

_bashrc_tag_start="# >> docker-conanexiles"
_bashrc_tag_end="# << docker-conanexiles "

setup_bashrc() {
    cat >> /bash.bashrc <<EOF


$_bashrc_tag_start
export wineprefix=/wine
export winearch=win64
$_bashrc_tag_end
EOF
}


grep "${_bashrc_tag_start}" /etc/bash.bashrc > /dev/null
[[ $? != 0 ]] && setup_bashrc

steamcmd_setup

# start supervisord
"$@"
