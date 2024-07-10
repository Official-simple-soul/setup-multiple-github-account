# Managing Multiple GitHub Accounts

## Description

This repository contains a Bash script to help you set up and manage multiple GitHub accounts on a single machine. It generates SSH keys, adds them to the ssh-agent, and updates your SSH configuration for easy switching between accounts.

## Features

- Generates a unique SSH key for each GitHub account
- Adds the SSH key to the ssh-agent
- Configures SSH to use the correct key for each account
- Provides instructions for adding the SSH key to GitHub

## Prerequisites

- Ensure you have `ssh` and `ssh-agent` installed on your machine.

## Getting Started

### Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/Official-simple-soul/setup-multiple-github-account.git
cd setup-multiple-github-account
```

# Run the Scripts

### Make the script executable and run it

```bash
chmod +x setup_github_accounts.sh
./setup_github_accounts.sh
```

## Follow the Prompts

- Enter the number of GitHub accounts you want to configure.
- For each account, enter the GitHub username and the email associated with that account.
- Follow the on-screen instructions to add the generated SSH key to your GitHub account.

# Example

### If you have two GitHub accounts:

```bash
How many GitHub accounts do you want to configure? 2
Configuring GitHub account 1...
Enter GitHub username: user1
Enter email associated with this GitHub account: user1@example.com
Generating SSH key for user1 using email user1@example.com...
# Follow the instructions to add the SSH key to your GitHub account
Configuring GitHub account 2...
Enter GitHub username: user2
Enter email associated with this GitHub account: user2@example.com
Generating SSH key for user2 using email user2@example.com...
# Follow the instructions to add the SSH key to your GitHub account
All specified GitHub accounts have been configured.
```

# Notes

- The script will generate an SSH key for each GitHub account and add a corresponding entry to your ~/.ssh/config file.
- The SSH keys will be named based on your GitHub username (e.g., id_rsa_user1).
