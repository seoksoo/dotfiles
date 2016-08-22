if [ -f default ]; then
    source default
fi

for file in ./{prompt,alias}; do
    #[ -r "$file" ] && [ -f "$file"] && source "$file";
    source "$file"
done;
unset file
