#!/usr/bin/env bash

set -euf -o pipefail

# Detect OS type
OS="$(uname -s)"

command_present() {
  command -v "$1" >/dev/null 2>&1
}

install_docker_compose() {
  if [[ "$OS" == "Linux" ]]; then
    curl -SL https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
  elif [[ "$OS" == "Darwin" ]]; then
    curl -SL https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-darwin-x86_64 -o /usr/local/bin/docker-compose
  elif [[ "$OS" =~ MINGW64_NT|MSYS_NT|CYGWIN_NT ]]; then
    curl -SL https://github.com/docker/compose/releases/download/v2.29.0/docker-compose-windows-x86_64.exe -o /usr/local/bin/docker-compose.exe
  else
    echo "Unsupported OS: $OS"
    exit 1
  fi
  chmod +x /usr/local/bin/docker-compose*
}

# Install docker-compose if not present
if ! command_present docker-compose; then
    install_docker_compose
fi

# Docker-compose commands to manage the webapp container
sudo docker-compose pull webapp
sudo docker-compose stop webapp
sudo docker-compose rm -f webapp  # Force removal without confirmation
sudo docker-compose up -d webapp

# Clean up unused Docker data
sudo docker system prune -a -f  # Force prune without confirmation
