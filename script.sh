#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Please install it from https://brew.sh/"
    exit 1
fi

# Install Docker, docker-credential-helper, docker-compose, and docker-buildx
echo "Installing Docker, docker-credential-helper, docker-compose, and docker-buildx..."
brew install docker docker-credential-helper docker-compose docker-buildx

# Create the .docker directory if it doesn't exist
if [ ! -d "$HOME/.docker" ]; then
    echo "Creating the ~/.docker directory..."
    mkdir "$HOME/.docker"
fi

# Configure the config.json file
CONFIG_FILE="$HOME/.docker/config.json"
echo "Configuring $CONFIG_FILE..."

# Create or modify the config.json file
cat > "$CONFIG_FILE" <<EOL
{
    "auths": {},
    "credsStore": "osxkeychain",
    "currentContext": "colima"
}
EOL

# Create the Docker CLI plugins directory if it doesn't exist
CLI_PLUGINS_DIR="$HOME/.docker/cli-plugins"
if [ ! -d "$CLI_PLUGINS_DIR" ]; then
    echo "Creating the $CLI_PLUGINS_DIR directory..."
    mkdir -p "$CLI_PLUGINS_DIR"
fi

# Create symbolic links for docker-compose and docker-buildx
echo "Creating symbolic links for docker-compose and docker-buildx..."
ln -sfn $(brew --prefix)/opt/docker-compose/bin/docker-compose "$CLI_PLUGINS_DIR/docker-compose"
ln -sfn $(brew --prefix)/opt/docker-buildx/bin/docker-buildx "$CLI_PLUGINS_DIR/docker-buildx"

# Check if docker compose works
echo "Checking the docker compose command..."
docker compose version

# Install Colima
echo "Installing Colima..."
brew install colima

echo "Setup complete. Docker is ready to use without Docker Desktop."
