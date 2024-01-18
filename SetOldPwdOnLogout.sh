#!/bin/bash

# Check if the line is already present in ~/.bash_profile
if ! grep -q "export OLDPWD=\$(cat ~/.oldpwd)" ~/.bash_profile; then
    echo 'export OLDPWD=$(cat ~/.oldpwd)' >> ~/.bash_profile
    echo "OLDPWD configuration added to ~/.bash_profile."
else
    echo ".bash_profile has already had the OLDPWD fix applied."
fi

# Check if the line is already present in ~/.bash_logout
if ! grep -q "echo \$(pwd) > ~/.oldpwd" ~/.bash_logout; then
    echo 'echo $(pwd) > ~/.oldpwd' >> ~/.bash_logout
    echo "OLDPWD configuration added to ~/.bash_logout."
else
    echo ".bash_logout has already had the OLDPWD fix applied."
fi