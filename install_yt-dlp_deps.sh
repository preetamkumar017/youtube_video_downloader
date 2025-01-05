#!/bin/bash

echo "Updating system and installing Homebrew (if not already installed)..."
# Update system packages
xcode-select --install

# Install Homebrew if not installed
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Installing Python 3.9+..."
# Install Python 3.9+ using Homebrew
brew install python@3.11

echo "Installing ffmpeg and ffprobe..."
# Install ffmpeg and ffprobe
brew install ffmpeg

echo "Installing yt-dlp using pip..."
# Install yt-dlp
pip3 install -U yt-dlp

echo "Installing optional dependencies..."
# Install optional dependencies
pip3 install certifi brotlicffi websockets requests \
    curl-cffi mutagen pycryptodomex secretstorage

echo "Setting up AtomicParsley for metadata handling..."
# Install AtomicParsley for metadata management
brew install atomicparsley

echo "Installing PhantomJS (for JavaScript execution)..."
# Install PhantomJS
brew install phantomjs

echo "Installing xattr for Mac metadata support..."
# Install xattr
pip3 install xattr

echo "Verifying installations..."
# Check versions to confirm successful installations
python3 --version
yt-dlp --version
ffmpeg -version

echo "All dependencies installed successfully! 🎉"
