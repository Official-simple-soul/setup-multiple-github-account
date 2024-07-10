#!/bin/bash

# Function to generate SSH key, add to ssh-agent and create config entry
generate_ssh_key_for_account() {
  local email=$1
  local github_username=$2
  local key_name="id_rsa_${github_username//[^[:alnum:]]/_}"

  echo "Generating SSH key for $github_username using email $email..."
  ssh-keygen -t rsa -b 4096 -C "$email" -f ~/.ssh/$key_name -N ""

  echo "Adding SSH key to ssh-agent..."
  ssh-add -K ~/.ssh/$key_name

  echo "Copy and add the following public key to your GitHub account ($github_username):"
  cat ~/.ssh/$key_name.pub
  read -p "Press enter once you've added this key to your GitHub account..."

  # Append to SSH config
  echo "Host github.com-$github_username
  HostName github.com
  User git
  IdentityFile ~/.ssh/$key_name
" >> ~/.ssh/config

  echo "SSH key and config for $github_username set up complete."
}

# Check for ssh-agent
if ! pgrep -q ssh-agent; then
  eval "$(ssh-agent -s)"
fi

# Ensure .ssh/config exists
touch ~/.ssh/config

# Ask for number of GitHub accounts
read -p "How many GitHub accounts do you want to configure? " account_count

for ((i = 1; i <= account_count; i++)); do
  echo "Configuring GitHub account $i..."
  read -p "Enter GitHub username: " github_username
  read -p "Enter email associated with this GitHub account: " email
  
  generate_ssh_key_for_account "$email" "$github_username"
done

echo "All specified GitHub accounts have been configured."

