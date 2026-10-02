if [[ ! $- =~ "i" ]]
then
	return;
fi

if [ -f default ]; then
    source default
fi

for file in ~/.dotfiles/{prompt,alias,local}; do
    if [ -f "$file" ]; then
        source "$file"
    fi
done;

unset file

# Added by QGenie for Codex
export PATH='/usr2/sshong/.local/share/qgenie-cli/codex-cli/bin':$PATH

# Added by QGenie for Codex
export CODEX_CA_CERTIFICATE='/etc/ssl/certs/ca-certificates.crt'
