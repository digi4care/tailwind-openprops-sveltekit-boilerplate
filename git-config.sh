#!/bin/bash

# Git Configuration Script
# This script sets up your Git user name and email globally

# Default values (you can change these)
DEFAULT_NAME="Your Name"
DEFAULT_EMAIL="you@example.com"

# Function to set git config
set_git_config() {
    local name="$1"
    local email="$2"
    
    git config --global user.name "$name"
    git config --global user.email "$email"
    
    echo "Git configuration has been updated:"
    echo "  User name: $name"
    echo "  Email: $email"
}

# Main script
echo "Git Configuration Setup"
echo "----------------------"

# Prompt for user input with default values
read -p "Enter your name [$DEFAULT_NAME]: " name
read -p "Enter your email [$DEFAULT_EMAIL]: " email

# Use default values if input is empty
name=${name:-$DEFAULT_NAME}
email=${email:-$DEFAULT_EMAIL}

# Set the git configuration
set_git_config "$name" "$email"
