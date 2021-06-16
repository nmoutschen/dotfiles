# Setup path
PATH="$HOME/bin:$PATH"

# Start Starship
eval "$(starship init bash)"

# Remove AWS_CONFIG if needed
unset AWS_CONFIG