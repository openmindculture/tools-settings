#!/bin/sh

NPM_INSTALL_OPTS='--loglevel=error'
PKG_MANAGER=$( command -v yum || command -v apt-get || command -v port || command -v brew ) || { echo "No system installer found (yum, apt-get, port, or brew)"; }
if which tput; then
	RED='tput setaf 1'
	GREEN='tput setaf 2'
	RESET='tput sgr0'
else
	RED=""; GREEN=""; RESET=""
fi
ERRORS=0

if [[ ! -z $PKG_MANAGER ]]; then

	if ! echo "$PKG_MANAGER" | egrep -q 'brew'; then
	  if [[ $EUID -ne 0  ]]   ; then
		echo "The install script must be run as root (unless when using brew on mac)."
		exit 1
	  fi
	fi

	echo "Using $PKG_MANAGER for installation."

	for prg in "sshpass" "nodejs" "npm" "jq"
	  do
		echo "------------------------"
		echo "installing $prg"
		$PKG_MANAGER install $prg
	  done

	echo "------------------------"

	npm install $NPM_INSTALL_OPTS -g phantomjs
	npm install $NPM_INSTALL_OPTS -g casperjs

fi

echo "------------------------"
echo "Verify installation ..."

for prg in "sshpass" "xsltproc" "node" "npm" "jq" "casperjs"
  do
    if ! which $prg; then
      echo "$prg is NOT INSTALLED!"
      ((ERRORS++))
    fi
  done

for prg in "phantomjs" "casperjs"
  do
    if ! npm list $prg; then
      echo "$prg is NOT INSTALLED!"
      ((ERRORS++))
    fi
  done

echo "------------------------"
if [[ ERRORS -gt 0 ]]; then
  $RED; echo "Installation NOT SUCCESSFUL! Check and install manually!"; $RESET
else
  $GREEN; echo "Installation successful."; $RESET
fi
echo "------------------------"

