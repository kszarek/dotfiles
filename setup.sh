#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE}")"
#git pull origin master
function doIt() {
    [[ -e .ssh/config ]] || ./decrypt.sh .ssh/config.enc
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh" --exclude "*.enc" \
        --exclude "README.md" --exclude ".git" --exclude "init" --exclude ".idea"  \ 
        -av --no-perms . ~
    source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt
    fi
fi
unset doIt
