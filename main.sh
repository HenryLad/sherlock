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

printf "[$Success]: Username is provided as \033[1m%s\033[0m\n" "$Username"


# Define an array with the most popular social media links
social_media_links=(
    "https://www.facebook.com/$Username"
    "https://www.twitter.com/$Username"
    "https://www.instagram.com/$Username"
    "https://www.linkedin.com/in/$Username"
    "https://www.snapchat.com/add/$Username"
    "https://www.pinterest.com/$Username"
    "https://www.reddit.com/user/$Username"
    "https://www.tiktok.com/@$Username"
    "https://www.youtube.com/$Username"
    "https://www.whatsapp.com/$Username"
)





curl -x https://instagram.com/$Username > /dev/null
if [ $? -eq 0 ]; then
    echo -e "[$Error]: No search results found for $Username"
    exit 1
fi
