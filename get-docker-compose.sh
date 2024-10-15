#!/usr/bin/env bash

set -euf -o pipefail

# Determine the OS platform
OS="$(uname -s)"
ARCH="$(uname -m)"

# Function to check if docker-compose is installed
command_present() {
  command -v docker-compose >/dev/null 2>&1
}

# Function to download and install docker-compose
install_docker_compose() {
  if [[ "$OS" == "Linux" || "$OS" == "Darwin" ]]; then
    # Linux and macOS: Use /usr/local/bin
    DESTINATION=/usr/local/bin/docker-compose
  elif [[ "$OS" == "MINGW"* || "$OS" == "CYGWIN"* || "$OS" == "MSYS"* ]]; then
    # Windows (Git Bash/WSL): Use /usr/bin
    DESTINATION=/usr/bin/docker-compose
  else
    echo "Unsupported OS: $OS"
    exit 1
  fi

  # Download docker-compose binary
  sudo curl -L "https://github.com/docker/compose/releases/download/2.28.1/docker-compose-${OS}-${ARCH}" -o "$DESTINATION"

  # Make the binary executable
  sudo chmod +x "$DESTINATION"

  echo "docker-compose has been installed successfully on $OS"
}

# Check if docker-compose is already installed
if command_present; then
  echo "docker-compose is already installed."
else
  install_docker_compose
fi
