#!/bin/sh

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 
Error="${RED}\033[1mERROR${NC}"
NOT_FOUND="${RED}\033[1mNOT FOUND${NC}"
Success='\033[0;32m\033[1mSUCCESS\033[0m'
echo -e "${RED}\033[1mUse this script at your own risk.${NC}"

if [ -z "$1" ]; then
   echo -e "[$Error]: First argument is empty. Please provide Username"
   exit 1
fi

Username=$1

echo -e "[$Success]: Username is provided as \033[1m$Username\033[0m"

# List of social media platforms to check
platforms=(
    "https://instagram.com/$Username/"
    "https://x.com/$Username"
    "https://www.facebook.com/$Username"
)

for URL in "${platforms[@]}"; do
    Response=$(curl -sL $URL)

    if echo "$Response" | grep -q "$Username"; then
        printf "[$Success]: Successfully retrieved data from %s\n" "$URL"
    else
        printf "[$NOT_FOUND]: The page for %s isn't available.\n" "$URL"
    fi
done