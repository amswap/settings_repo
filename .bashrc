# adapted from cshrc
# Generic $dotdir/cshrc
# Engineering Services (ES)
#

##
# Things the user might wish to set.
#set USER_PATH=( ~/bin )                         # Extra paths.
export EDITOR=vim                               # Preferred editor.
export PRINTER=lp                               # Preferred printer.
export NNTPSERVER=usenet.cisco.com              # Preferred news server.
##
# Should the full environment be set up even for non-interactive shells?
# Probably not but here is a variable to control it.
export FULLENV=false                            # 'true' or 'false'

##
# Should all paths (even NFS, which might hang) be set up at login?
# The alias "fullpath" is available to setup your full path.  It can
# also be used to change your path by changing USER_PATH above.
set FULLPATH=true                               # 'true' or 'false'
#set -o vi
###########################################################################
###########################################################################
# Everything above this line helps configure the environment.

###########################################################################
# Everything below this line is run for interactive shells.
# If you wish the full environment even in non-interactive
# shells set FULLENV above to 'true'.

umask 022                                      # no write by group or other
# export USER=`/auto/ddts/ddtshome/bin/whoami`
# export USER=`/auto/ddts/ddtshome/bin/whoami`
# set -o noclobber

####### env vars 
# export PATH=/sw/packages/cscope/12.9/solaris2bin/:~/bin:$PATH:/usr/local/bin:/auto/ddts/ddtshome/bin:/usr/openwin/bin:/auto/oieda2/vslick/v9.0/solaris/bin
export PATH=$PATH:/usr/local/bin:/auto/slickedit/vs1203/bin:/auto/ddts/ddtshome/bin:/usr/openwin/bin:/router/bin:/auto/mssbu-swtools/bin
export PS1="\H (\W) % "
# export PS1="\H (\w) % "
#export LM_LICENSE_FILE=9050@csi-admin1
#export LM_LICENSE_FILE=7465@ls-na-east
#:27002@sjc-eng1-lic:27001@rtg-lnx64-036
export LM_LICENSE_FILE=27003@sjc-eng1-lic
export VTECH_LICENSE_FILE=7465@ls-na-temp
#export ACME_DIFF_CMD="cleartool diff"
#export DISPLAY=sjc-xdm-07:39

if [ "$PS1" ]; then

    if [ -x /usr/bin/tput ]; then
      if [ "x`tput kbs`" != "x" ]; then # We can't do this with "dumb" terminal
        stty erase `tput kbs`
      elif [ -x /usr/bin/wc ]; then
        if [ "`tput kbs|wc -c `" -gt 0 ]; then # We can't do this with "dumb" terminal
          stty erase `tput kbs`
        fi
      fi    fi
    case $TERM in
        xterm*)
                if [ -e /etc/sysconfig/bash-prompt-xterm ]; then
                        PROMPT_COMMAND=/etc/sysconfig/bash-prompt-xterm
                else
                PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
                fi
                ;;
        screen)
                if [ -e /etc/sysconfig/bash-prompt-screen ]; then
                        PROMPT_COMMAND=/etc/sysconfig/bash-prompt-screen
                else
                PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
                fi
                ;;
        *)
                [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default

            ;;
    esac

    PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND ; }"'echo -e $$\\t$USER\\t$HOSTNAME\\tscreen $WINDOW\\t`date +%D%t%T%t%Y%t%s`\\t$PWD"$(history 1)" >> ~/.bash_eternal_history'

    # Turn on checkwinsize
    shopt -s checkwinsize

    #Prompt edited from default
    [ "$PS1" = "\\s-\\v\\\$ " ] && PS1="[\u \w]\\$ "

    if [ "x$SHLVL" != "x1" ]; then # We're not a login shell
        for i in /etc/profile.d/*.sh; do
            if [ -r "$i" ]; then
                . $i
            fi
        done
    fi
fi

# Append to history
# See: http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/x329.html
shopt -s histappend

# Make prompt informative
# See:  http://www.ukuug.org/events/linux2003/papers/bash_tips/
PS1="\[\033[0;34m\][\u@\h:\w]$\[\033[0m\]"


# 2.1) Safety
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber


# 2.2) Listing, directories, and motion
alias ll="ls -alrtF --color"
alias la="ls -A"
alias l="ls -CF"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'


# 2.4) grep options
#export GREP_OPTIONS='--color=auto'
#export GREP_COLOR='1;31' # green for matches

# 2.5) sort options
# Ensures cross-platform sorting behavior of GNU sort.
# http://www.gnu.org/software/coreutils/faq/coreutils-faq.html#Sort-does-not-sort-in-normal-order_0021
unset LANG
export LC_ALL=POSIX


####### general aliases
alias fat-tire='telnet 172.29.122.199 2001'
alias spirit-binary='jam -j16 -sOPTIM_DISABLE=y -sPROCNTO_SPIRIT=y -l spirit/invmgr/obj-x86_64-linux-spirit/sdr_invmgr'
alias sshfs-cmd='vim ~/scripts/sshfs'
alias myads='ssh sjc-ads-727'
alias cainascript='~/bin/find_production.sh'
alias filehistory='acme ct lshistory -graphical' 
alias myvnc='sjc-xdm-123:67'
alias releases_dir='cd /nfs/cweb0/www-home/Eng/OIBU/WWW'
alias source_ng_pita='source /auto/edatools/oicad/tools/vxr_user/vxr_3442/setup.sh; sim clean'
alias source_panini_latest='source /auto/edatools/oicad/tools/vxr_user/vxr_3723/setup.sh; sim clean'
alias crstest="ssh ott-crstest5"
alias srcarchive='cd /auto/srcarchive1'
alias rajanlds='sjc-lds-513'
alias filesize='du -h * | sort -n'
alias xrutone='/auto/xrut/bin/vxrlogin one'
alias xrutonelc='/auto/xrut/bin/vxrlogin one.0/2/CPU0'
alias xruttwo='/auto/xrut/bin/vxrlogin two' 
alias xruttwolc='/auto/xrut/bin/vxrlogin two.0/2/CPU0'
alias xrutthree='/auto/xrut/bin/vxrlogin three' 
alias xrutthreelc='/auto/xrut/bin/vxrlogin three.0/2/CPU0'
alias ennode0='lboot -c ios.0/0/CPU0'
alias ennode1='lboot -c ios.0/1/CPU0'
alias testpie='/router/bin/jam -notb -dax hfr-infra-test-p.pie'
alias xb='xterm -T xterm -sb -sl 5000 -e bash &'
alias wsefr='/auto/iox/bin/xr_my_ws_efr'
alias sshag='ssh-agent $SHELL; bash'
alias sshag2='ssh-add /users/sambre/.ssh/id_rsa'
alias enxrreg='env LC_ALL=en_US.UTF8 ljam regressions'
alias xrut_enxr='/auto/xrut/xrut-gold/sanity/smoke-test.py'
alias em='emacs -nw -q \!*'
alias sourcebash='. ~/.bashrc'
alias h='history'
alias duh_sort='du | sort -nr | cut -f2- | xargs du -hs'
alias openbash='vim ~/.bashrc'
alias hfrbuild='/auto/iox/bin/xr_bld -plat hfr -ext 1 -jam_opt "-j12 -d2 " -mail_to "sambre"'
alias vikbuild='/auto/iox/bin/xr_bld -plat asr9k -ext 1 -jam_opt "-j12 -d2 " -mail_to "sambre"'
alias aipcdiffs='cd /tftpboot/sambre/aipcdiffs/'
alias lsaipcdiffs='ll /tftpboot/sambre/aipcdiffs/'
alias aipctests='vim /auto/xr_pi/PRODUCTION/ATS_TREE/ena-tests/controlpt/services/infra/aipc/src/aipc_internode_cfg.tcl'
# set_pie_target xou

alias xlsvtree='acme ct lsvtree -gr'
alias sn='snavigator '
alias btags='find . -name '*.[chCH]' | etags -'
alias bwtags='find aaa chkpt ifmgr infra lib ha platforms sysdb config compmgmt sysmgr sysmgr_lite -name '*.[chCH]' | etags -'
alias bcscope='export WS=`pwd`; echo $WS; find `pwd` -path $WS/chkpt ! -path $WS/infra ! -path $WS/lib ! -path $WS/ha ! -path $WS/platforms ! -path $WS/platforms/c12000 -prune -o -path $WS/platforms/gt64260disc -prune -o -path $WS/sysdb ! -path $WS/config ! -path $WS/compmgmt ! -path $WS/sysmgr ! -path $WS/sysmgr_lite -name '*.[chCH]' > cscope.files; /sw/packages/cscope/12.9/solaris2bin/cscope -b'
alias cscope='/usr/bin/cscope'
alias slick='/auto/slickedit/vs1203/bin/vs -sul +new'
alias slicknew='/auto/edatools/bin/vs &'
# Pass qfts job-id as argument for below
alias qfts-check-qstatus='/usr/cisco/contrib/bin/earms jobRequest -qtime'
alias qfts-log-qstatus='/usr/cisco/contrib/bin/earms getresult'
#alias wscope='/auto/mssbu-swtools/iox/bin/wscope -lu'
alias wscope='~/bin/wscope -lu'

##### Acme commands
alias ad='acme diff -opts \"-pC5\"'
alias adws='acme diff -opts \"-C5 -p\"'
alias au='acme update -nodep -comp'
alias alv='acme lsvtree -g -comp'
alias vsacme='acme diff -opts graphical -cmd \"/auto/slickedit/vs1203/bin/vsdiff\"'
alias xacme=~/bin/xacme
alias vib='vi ~/.bashrc'

### vnc server for hi-res
alias vnc-hi-res='vncserver -geometry 1280x960 -alwaysshared'
alias vnc-mac='vncserver -geometry 1148x748 -alwaysshared'
alias vnc-mac-office='vncserver -geometry 1250x905 -alwaysshared'

###### directory aliases
####### Acme Workspace
alias nbws='cd /nobackup/sambre'
alias xradiff='cd /ws/tangiral/3_8_XRAY'
alias nbld='/users/pals/bin/nbld.pl -f $1 -b hfr'
alias tf='/tftpboot/sambre'
alias cdtf='cd /tftpboot/sambre'
alias lsrepl='ll /tftpboot/sambre/repl_rebase'
alias builds='/auto/tftpboot-projects/enabuilds/nightly'

#EnXR aliases
alias lboot='lboot -m'
alias ljam='ljam -j8 -sPROJECT=router.jam 2>&1 | tee enxrlog.txt'
alias lbootaux='lboot -m -c'
alias ldual='llaunch -m -a -fdual-rp'
alias lproxy='./infra/test/linux/bin/comp-mdata_tool.pl -c public chkpt/comp-mdata.pl > chkpt/obj-x86/Targets.jam'
########## Build HFR images (from Hongchi)


######## New Mexico Testbed #######################
alias nm-d='telnet 172.19.72.148 2001'
alias nm-d-aux='telnet 172.19.72.148 2002'
alias nm-d-s='telnet 172.19.72.148 2003'
alias nm-d-s-aux='telnet 172.19.72.148 2004'
alias nm-f1='telnet 172.19.72.168 2001'
alias nm-f2='telnet 172.19.72.168 2003'
alias nm-nd='telnet 172.19.72.148 2009'
alias nm-nd-aux='telnet 172.19.72.148 2010'
alias nm-nd-s='telnet 172.19.72.148 2011'
alias nm-nd-s-aux='telnet 172.19.72.148 2012'
alias nm-t1='telnet 172.19.72.148'
alias nm-t2='telnet 172.19.72.168'


set bell-style none




######## bonfonte Testbed ##############################
alias bonfonte="telnet 172.19.72.144 2007"
alias bonfonte-aux="telnet 172.19.72.144 2008"
alias bonfonte-s="telnet 172.19.72.144 2005"
alias bonfonte-t="telnet 172.19.72.144"

######## disneyworld Testbed ##############################
alias disneyworld="telnet 172.19.72.63 2011"
alias disneyworld-aux="telnet 172.19.72.63 2012"
alias disneyworld-s="telnet 172.19.72.63 2013"
alias disneyworld-s-aux="telnet 172.19.72.63 2014"

######## fairyland Testbed ##############################
alias fairyland="telnet 172.19.72.144 2011"
alias fairyland-aux="telnet 172.19.72.144 2012"
alias fairyland-s="telnet 172.19.72.144 2013"
alias fairyland-s-aux="telnet 172.19.72.144 2014"

######## Northstar Testbed ##############################
alias northstar="telnet 172.19.74.19 2033"
alias northstar-aux="telnet 172.19.74.19 2034"
alias northstar-s="telnet 172.19.74.19 2035"
alias northstar-s-aux="telnet 172.19.74.19 2036"

######## Southstar Testbed ##############################
alias southstar="telnet 172.19.74.19 2037"
alias southstar-aux="telnet 172.19.74.19 2038"
alias southstar-s="telnet 172.19.74.19 2039"
alias southstar-s-aux="telnet 172.19.74.19 2040"

######## Sixflags Testbed ##############################
alias sixflags="telnet 172.19.71.180 2001"
alias sixflags-aux="telnet 172.19.71.180 2002"
alias sixflags-s="telnet 172.19.71.180 2003"
alias sixflags-s-aux="telnet 172.19.71.180 2004"

######## Wonderland Testbed ##############################
alias wonderland="telnet 172.19.71.164 2033"
alias wonderland-aux="telnet 172.19.71.164 2034"
alias wonderland-s="telnet 172.19.71.164 2035"
alias wonderland-s-aux="telnet 172.19.71.164 2036"

alias smoke64intra="/auto/xrut/xrut-gold/ng-bringup/smoke-test.py -pPX -S . -w sjc-lds-861:/nobackup/sambre/spirit-pi-sanities/ --vxr-use-64 --vxr-mem-rp=6000 --vxr-mem-lc=6000"
alias smoke64inter="/auto/xrut/xrut-gold/ng-bringup/smoke-test.py -mpPX -S . -w sjc-lds-861:/nobackup/sambre/spirit-pi-sanities/ --vxr-use-64 --vxr-mem-rp=6000 --vxr-mem-lc=6000"

alias cpimgpiref="cp img-piref/piref-spirit-full-x-64.vm.lc /ws/sambre-sjc/;cp img-piref/piref-spirit-full-x-64.vm /ws/sambre-sjc/"
alias vxrsetup="source /auto/edatools/oicad/tools/vxr_user/latest/setup.sh"
alias lwmpie="jam -j16 -sOPTIM_DISABLE=y -sPROCNTO_SPIRIT=y -platform panini -or 0 infra/infra/rpm > jampie"
alias lwm_sock_panini_bld="/router/bin/jam -sPROCNTO_SPIRIT=y -sOPTIM_DISABLE=y -sALL_IMAGES=y -sLWM_SOCKET panini-full-x.iso >/nobackup/sambre/r50x_lwmsock/xr_bld.panini.log 2>&1"


function grepbash() {
         grep $1 ~/.bashrc 
}


function cpimg() {
        cp ./obj-ppc/comp-hfr-mini.vm $1
}

function ddtscomp() {
       ~/bin/ddtscomp $1
}

function greprec() {
      echo $1  
      find . -exec grep -Hn "$1" {} 2>/dev/null \; | more
}

function patch() {
        acme patch -i $1
}

function reverse() {
        acme patch -reverse -i $1
}

function revert() {
        acme diff > revert.diff
        acme patch -reverse -i revert.diff
}

function buildpie() {
        jam -j8 -platform $1 $2/pie
}

function cstatic() {
        cstatic_changeset -comp $1 -j 12 

}
function buildaipctestpie() {
        /router/bin/jam -notb -dax -platform hfr-p -sJAM_INCLUDE_TEST_FILES=1 infra/test/aipc/pie
}
function build() {
      /auto/iox/bin/xr_bld -plat $1 -ext 1 -jam_opt "-j12 -d2 " -mail_to "sambre"
}

function build_spirit_lite() {
date;
PROCNTO_SPIRIT=y SPIRIT_BUILD=1 jam -sXROS=linux -sOPTIM_DISABLE=y piref-spirit-mini-x.vm -l;
date;
}

function build_spirit_full() {
thirdparty/opensource/release/xr_prepare.sh;
PROCNTO_SPIRIT=y SPIRIT_BUILD=1 jam -j8 -sXROS=linux -sOPTIM_DISABLE=y -sALL_IMAGES=y piref-spirit-full-x.vm 2>&1 | tee jamlog.txt
cp ./img-piref/piref-spirit-full-x.vm /tftpboot/sambre/pirefimages/
cp ./img-piref/piref-spirit-full-x.vm.lc /tftpboot/sambre/pirefimages/
}

function build_spirit_full_64() {
PROCNTO_SPIRIT=y SPIRIT_BUILD=1 jam -j8 -sXROS=linux -sOPTIM_DISABLE=y -sALL_IMAGES=y piref-spirit-full-x-64.vm -l
cp ./img-piref/piref-spirit-full-x-64.vm /tftpboot/sambre/pirefimages/
cp ./img-piref/piref-spirit-full-x-64.vm.lc /tftpboot/sambre/pirefimages/
}

function graphical_diff() {
export DISPLAY=$1
export ACME_DIFF_CMD="cleartool diff"
export ACME_DIFF_OPTS="" 
acme diff -opts graphical & 
}

function prepvxr() {
export DISPLAY=$1
source /auto/edatools/oicad/tools/vxr_user/latest/setup.sh
}

function spiritjam() {
/auto/iox/bin/xr_bld -plat $1
}
