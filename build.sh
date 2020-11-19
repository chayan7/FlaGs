#!/bin/sh

unset DYLD_LIBRARY_PATH
if ! echo "$0" | grep '\.sh$' > /dev/null; then
    printf 'Please run using "bash" or "sh", but not "." or "source"\\n' >&2
    return 1
fi

conv="$(conda -V 2>&1)"
if [ "$ans" = "conda: command not found" ];then
	printf " Please install Conda properly and run this again, Thanks. "
fi
if [ "$ans" != "conda: command not found" ];then
	printf "Adding FlaGs environment with all dependencies"
fi


THIS_DIR=$(DIRNAME=$(dirname "$0"); cd "$DIRNAME"; pwd)
THIS_FILE=$(basename "$0")
THIS_PATH="$THIS_DIR/$THIS_FILE"
ENV_PATH="$THIS_DIR/env"
MAC_FILE="$ENV_PATH/eFlaGs.txt"
LIN_FILE="$ENV_PATH/elinFlaGs.txt"

if [ "$(uname)" = "Linux" ];then
	conda create --name eFlaGs --file "$LIN_FILE"
	printf "\\n"
	printf "Do you wish the installer to activate FlaGs environment ?\\n"
	printf "[yes] >>> "
	read -r ans
	if [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "\\nPlease type the following command from a terminal to activate FlaGs environment and run:\\n"
		printf "conda activate eFlaGs"
		printf "To deactivate please type:"
		printf "conda deactivate"
		printf "\\n"
		exit 2
	fi
	if ! [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		conda activate eFlaGs
		printf "\\nActivated FlaGs environment"
		printf "\\nFor this change to become active, you have to open a new terminal.\\n"
		printf "\\n"
		printf "To deactivate please type:"
		printf "conda deactivate"
		printf "\\n"
	fi
fi


if [ "$(uname)" = "Darwin" ]; then
	conda create --name eFlaGs --file "$MAC_FILE"
	printf "\\n"
	printf "Do you wish the installer to activate FlaGs environment ?\\n"
	printf "[yes] >>> "
	read -r ans
	if [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "\\nPlease type the following command from a terminal to activate FlaGs environment and run:\\n"
		printf "conda activate eFlaGs"
		printf "To deactivate please type:"
		printf "conda deactivate"
		printf "\\n"
		exit 2
	fi
	if ! [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		conda activate eFlaGs
		printf "\\nActivated FlaGs environment"
		printf "\\nFor this change to become active, you have to open a new terminal.\\n"
		printf "\\n"
		printf "To deactivate please type:"
		printf "conda deactivate"
		printf "\\n"
	fi
fi
