if [ -f default ]; then
    source default
fi

for file in ~/.dotfiles/{prompt,alias,local}; do
    source "$file"
done;

unset file
