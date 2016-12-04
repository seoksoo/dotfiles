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
