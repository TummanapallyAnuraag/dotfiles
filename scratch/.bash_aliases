## GIT ##
alias gits="git status"
alias gcfdx="git clean -fdx -e tags -e docs/ "
alias gsu="git submodule update"
alias gru="git remote update"
alias grv="git remote -v"
alias gitl="git log"
alias gitlno="git log --name-only"
alias gitl2="git log --graph --abbrev-commit --decorate --date=relative --all"
alias gitl3="git log --graph --oneline --decorate --all"

## MISC ##
export EDITOR=vim

function parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

function home() {
    cd ~
    if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "~"
	fi
}

function sf() {
	cd /a/system-firmware
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "sf"
	fi
}
function sft() {
	cd /a/system-firmware-test
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "sft"
	fi
}
function sfr() {
	cd /a/system-firmware-releases
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "sfr"
	fi
}
function sfa() {
	cd /a/system-firmware-autogen
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "sfa"
	fi
}
function sje() {
	cd /a/soc-json-extract
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "sje"
	fi
}
function rom() {
	cd /a/k3rom-release
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "rom"
	fi
}
function vlab() {
	cd /a/presilicon-sysfw-dev/simulators/vlab
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "vlab"
	fi
}

function logs() {
	cd /a/logs/picocom
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "pico"
	fi
}
function localhsm() {
	cd /localhsm
	if [[ $TMUX ]]; then
		# a tmux session is running
		tmux rename-window "localhsm"
	fi
}
function capture_logs() {
    SOC=am62
    tmux split-window -h
    tmux send-keys "logs" C-m
    tmux send-keys "make log_m4_${SOC}" C-m
    tmux split-window -v
    tmux send-keys "logs" C-m
    tmux send-keys "make log_r5_${SOC}" C-m
}

export gbr=$( echo $(parse_git_branch) | sed 's/[(,)]//g' )
alias myip='ip a | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}"'
alias em="emacs -nw"

#alias cpio_pack="cpio -idv < ~/path/to/rootfs.cpio"
#alias cpio_unpack="find . | cpio -o > newrootfs.cpio"


## FOR SYSFW DEV WORK ##
export TOOLCHAIN_PATH_M3="/opt/sysfw/cgt/cgt_current"
#export XDC_INSTALL_PATH="/opt/sysfw/xdc/xdc_current"
export XDC_INSTALL_PATH="/opt/sysfw/xdc/xdc_latest"
#export BIOS_INSTALL_PATH="/opt/sysfw/sysbios/bios_current"
export BIOS_INSTALL_PATH="/opt/sysfw/sysbios/bios_latest"
## unset these for PDK
export KW_ROOT="/opt/sysfw/kw/kw_current"
#export PIP_CONFIG_FILE="/etc/pip.conf"

export DMSC_ROM_ROOT=/a/k3rom-release/dmsc-boot-rom

## PATH ##
# Only on a Non-Tmux session
if [[ -z $TMUX ]]; then
    PATH="/dmsc/system-firmware-scripts/:${PATH}"
    PATH="/a/wbin/:${PATH}"
    PATH="/opt/arm/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/:${PATH}"
	PATH="/opt/custom/gcc_latest/bin/:${PATH}"
	PATH="~/.vim/plugin/:${PATH}"
    export PATH
fi
PATH="~/.local/bin/:${PATH}"
export PATH

# for ccs errors
export no_proxy="${no_proxy},127.0.0.1"

## minicom aliases

alias minicom_m3_am6="minicom -c on -w -C /a/logs/am6_m3.txt usb6"
alias minicom_r5_am6="minicom -c on -w -C /a/logs/am6_r5.txt usb5"

alias minicom_m3_j721e="minicom -c on -w -C /a/logs/j721e_m3.txt usb0"
alias minicom_r5_j721e="minicom -c on -w -C /a/logs/j721e_r5.txt usb1"

alias clear_logs="rm -f /a/logs/*"

## tmux
#SYSFW="/a/system-firmware"
#SYSFWT="/a/system-firmware-test"
# SYSFW="/home/vagrant/system-firmware-releases/src/system-firmware"
ASYSFW="/a/system-firmware"
SYSFW="$SYSFW"
# SYSFWT="/home/vagrant/system-firmware-releases/src/system-firmware-test"
ASYSFWT="/a/system-firmware-test"
SYSFW_TEST="$ASYSFWT"
PDK="/ti/jacinto/workarea/pdk/packages/ti/"
PDK2="/ti/am62x/workarea/pdk/packages/ti/"

alias mymux="tmux -2 new-session -s myworkarea-sysfw -n sysfw -c $SYSFW -d; tmux new-window -n sysfw-t -c $SYSFWT ; tmux new-window -n playgr -c /home/vagrant; tmux -2 attach"

function unsetvars() {
    unset TOOLCHAIN_PATH_M3;
    unset XDC_INSTALL_PATH;
    unset BIOS_INSTALL_PATH;
    echo $TOOLCHAIN_PATH_M3 $XDC_INSTALL_PATH $BIOS_INSTALL_PATH;
}

alias mypdk="tmux -2 new-session -s myworkarea-pdk -n pdk -c $PDK -d; tmux new-window -n pdk -c $PDK ; tmux new-window -n playgr -c /home/vagrant; tmux -2 attach"

# MISC.
alias pdkhome="cd $PDK"
alias pdkdocs="cd /ti/jacinto/workarea/pdk/docs/internal_docs/sphinx"


alias lscn="ls --color=none"
alias llcn="ll --color=none"

alias z="z -i tags"
alias ccs="/opt/ccs1040/ccs/eclipse/ccstudio"

function searchc() {
    grep -irn --include=*.c $1 .
}
