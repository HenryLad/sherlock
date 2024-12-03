#!/bin/sh

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 
Error="${RED}\033[1mERROR${NC}"
Success='\033[0;32m\033[1mSUCCESS\033[0m'
printf "${RED}\033[1mUse this script at your own risk.${NC}\n"

if [ -z "$1" ]; then
   printf "[$Error]: Username is empty. Please provide a username.\n"
   exit 1
fi

Username=$1

printf "[$Success]: Username is provided as \033[1m%s\033[0m\n" "$Username"

# Define the Instagram profile URL
profile_url="https://www.instagram.com/$Username/"

# Send a GET request to the Instagram profile page
response=$(curl -sL $profile_url)

# Check if the profile exists by looking for the <meta property="og:description"> tag
if echo "$response" | grep -q '<meta property="og:description"'; then
    printf "[$Success]: The username %s exists on Instagram.\n" "$Username"
else
    printf "[$Error]: The username %s does not exist on Instagram.\n" "$Username"
fi