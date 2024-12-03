#!/bin/sh


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


platforms=(
    "Instagram:https://www.instagram.com/$Username/"
    "Twitter:https://twitter.com/$Username"
    "Facebook:https://www.facebook.com/$Username"
    "LinkedIn:https://www.linkedin.com/in/$Username"
    "Snapchat:https://www.snapchat.com/add/$Username"
    "Pinterest:https://www.pinterest.com/$Username"
    "Reddit:https://www.reddit.com/user/$Username"
    "TikTok:https://www.tiktok.com/@$Username"
    "YouTube:https://www.youtube.com/$Username"
)


check_profile() {
    platform_name=$1
    profile_url=$2

    response=$(curl -sL $profile_url)

    if echo "$response" | grep -q '<meta property="og:description"' || echo "$response" | grep -q '<title>'; then
        printf "[$Success]: The username %s exists on %s.\n" "$Username" "$platform_name"
    else
        printf "[$Error]: The username %s does not exist on %s.\n" "$Username" "$platform_name"
    fi
}


for platform in "${platforms[@]}"; do
    platform_name=$(echo $platform | cut -d: -f1)
    profile_url=$(echo $platform | cut -d: -f2)
    check_profile "$platform_name" "$profile_url"
done