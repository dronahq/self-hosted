#!/usr/bin/env bash

set -euf -o pipefail

# Detect OS and version
case "$(uname -s)" in
    Linux*)     
        OS="Linux"
        DISTRO=$( (lsb_release -ds || cat /etc/*release || uname -om) 2>/dev/null | head -n1)
        ;;
    Darwin*)    
        OS="macOS"
        DISTRO="macOS"
        ;;
    CYGWIN*|MINGW*|MSYS*)    
        OS="Windows"
        DISTRO="Windows"
        ;;
    *)          
        OS="Unknown"
        DISTRO="Unknown"
        ;;
esac

echo "Operating System: $OS"
echo "Distribution: $DISTRO"

# Function to check if a command exists
command_present() {
  command -v "$1" >/dev/null 2>&1
}

# Check if Docker is already installed
if command_present docker; then
    echo "Docker is already installed."
    exit 0
fi

# Install wget and Docker based on the OS
if [ "$OS" = "Linux" ]; then
    if ! command_present wget; then
        if command_present apt; then
            sudo apt update && sudo apt install -y wget
        elif command_present yum; then
            sudo yum install -y wget
        elif command_present dnf; then
            sudo dnf install -y wget
        elif command_present pacman; then
            sudo pacman -Sy wget
        else
            echo "Unsupported package manager. Please install wget manually."
            exit 1
        fi
    fi
    # Install Docker
    wget -qO- https://get.docker.com/ | sh

elif [ "$OS" = "macOS" ]; then
    if ! command_present wget; then
        if command_present brew; then
            brew install wget
        else
            echo "Homebrew not found. Please install Homebrew and try again."
            exit 1
        fi
    fi
    # Install Docker via Homebrew
    brew install --cask docker

elif [ "$OS" = "Windows" ]; then
    if ! command_present wget; then
        if command_present choco; then
            choco install wget
        else
            echo "Chocolatey not found. Please install Chocolatey and try again."
            exit 1
        fi
    fi
    # Install Docker via Chocolatey
    choco install docker-desktop

else
    echo "Unsupported operating system."
    exit 1
fi

echo "Docker installation completed."
