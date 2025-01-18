#!/bin/bash

# Define source directory
SRC_DIR="/opt/build"

# Set default domain
DEFAULT_DOMAIN="//niles.startupfarms.corp/niles"
echo -n "Enter your domain or press Enter for the default domain [$DEFAULT_DOMAIN]: "
read DOMAIN_INPUT

# Use input domain or fall back to the default
DOMAIN=${DOMAIN_INPUT:-$DEFAULT_DOMAIN}
echo "Selected domain: $DOMAIN"

# Prompt for username
echo -n "Enter your username for Startupfarms (e.g., tanishk.marothiya): "
read USERNAME

# Display the entered username
echo "Username: $USERNAME"

# Prompt for password (hidden input)
echo -n "Enter your Startupfarms password: "
read -s PASSWD
echo # Add a newline for formatting

# Set default branch
DEFAULT_BRANCH="master_12.1"
echo -n "Enter branch name or press Enter for the default branch [$DEFAULT_BRANCH]: "
read BRANCH_INPUT

# Use input branch or fall back to the default
BRANCH=${BRANCH_INPUT:-$DEFAULT_BRANCH}
echo "Selected branch: $BRANCH"

# Prompt for build number
echo -n "Enter build number (e.g., Build_12.1.501.1282): "
read BUILD
echo "Selected build number: $BUILD"

# Execute smbclient command
echo "Connecting to $DOMAIN and fetching build files..."
smbclient "$DOMAIN" -U "startupfarms.corp\\$USERNAME%$PASSWD" -c \
  "cd ALERTENTERPRISE/BUILD/AEHSC/uat/$BRANCH/$BUILD; ls; recurse; prompt; mget api.zip job.zip ui.zip DB.zip"

echo "File transfer complete!"

