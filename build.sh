#!/bin/sh
unset DYLD_LIBRARY_PATH
if ! echo "$0" | grep '\.sh$' > /dev/null; then
    printf 'Please run using "bash" or "sh", but not "." or "source"\\n' >&2
    return 1
fi

THIS_DIR=$(DIRNAME=$(dirname "$0"); cd "$DIRNAME"; pwd)
THIS_FILE=$(basename "$0")
THIS_PATH="$THIS_DIR/$THIS_FILE"
ENV_PATH="$THIS_DIR/bin"
cd "$ENV_PATH"
wget http://130.239.193.227/html/eFlaGs.tar.gz
cd "../"
ENV_FILE="$ENV_PATH/eFlaGs.tar.gz"
rm -rf $ENV_PATH/env
mkdir $ENV_PATH/env
tarPath="$ENV_PATH/env/"
PATH_TO_ADD="$ENV_PATH/env/bin/"
PATH_TO_Act="$ENV_PATH/env/bin"
tar -xvzf $ENV_FILE -C $tarPath

if [ "$(uname)" = "Linux" ];then
	if [ -f "$HOME"/.bashrc ]; then
		BASH_RC="$HOME"/.bashrc
		edit=".bashrc"
	fi
	if ! [ -f "$HOME"/.bashrc ]; then
		BASH_RC="$HOME"/.bashrc
		edit=".bashrc"
	fi
	printf "\\n"
	printf "Do you wish the installer to prepend the FlaGs install location\\n"
	printf "to PATH in your %s ? [yes|no]\\n" "$BASH_RC"
	printf "[yes] >>> "
	read -r ans
	if [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "\\nPlease add the following line to your $edit and restart terminal to run FlaGs:\\n"
		printf "export PATH="$PATH_TO_ADD":\$PATH\\n"
		printf "\\n"
		exit 2
	fi
	if ! [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "Appending source %s/activate to %s\\n" "$PATH_TO_Act" "$BASH_RC"
		echo "export PATH=\""$PATH_TO_ADD":\$PATH"\" >> "$BASH_RC"
		printf "\\n"
		printf "For this change to become active, you have to open a new terminal.\\n"
		printf "\\n"
	fi
fi


if [ "$(uname)" = "Darwin" ]; then
	if [ -f "$HOME"/.bash_profile ]; then
		BASH_RC="$HOME"/.bash_profile
		edit=".bash_profile"
		echo "$BASH_RC"
	fi
	if ! [ -f "$HOME"/.bash_profile ]; then
		touch "$HOME"/.bash_profile
		BASH_RC="$HOME"/.bash_profile
		edit=".bash_profile"
	fi
	printf "\\n"
	printf "Do you wish the installer to prepend the FlaGs install location\\n"
	printf "to PATH in your %s ? [yes|no]\\n" "$BASH_RC"
	printf "[yes] >>> "
	read -r ans
	if [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "\\nPlease add the following line to your $edit and restart terminal to run FlaGs:\\n"
		printf "export PATH="$PATH_TO_ADD":\$PATH\\n"
		printf "\\n"
		exit 2
	fi
	if ! [ "$ans" != "yes" ] && [ "$ans" != "Yes" ] && [ "$ans" != "YES" ] && [ "$ans" != "y" ]   && [ "$ans" != "Y" ]; then
		printf "Appending source %s/activate to %s\\n" "$PATH_TO_Act" "$BASH_RC"
		echo "export PATH=\""$PATH_TO_ADD":\$PATH"\" >> "$BASH_RC"
		printf "\\n"
		printf "For this change to become active, you have to open a new terminal.\\n"
		printf "\\n"
	fi
fi
