#!/bin/sh

# Farbdefinitionen
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
BOLD='\033[1m'
Error="${RED}${BOLD}ERROR${NC}"
Success="${GREEN}${BOLD}SUCCESS${NC}"
Info="${BOLD}INFO${NC}"

# Hinweis zur Nutzung
printf "${RED}${BOLD}Use this script at your own risk.${NC}\n"

# Überprüfung des Benutzernamens
if [ -z "$1" ]; then
    printf "[$Error]: Username is empty. Please provide a username.\n"
    exit 1
fi

Username=$1
printf "[$Success]: Username is provided as ${BOLD}%s${NC}\n" "$Username"

# Plattform-URLs
platforms=(
    "Instagram|https://www.instagram.com/$Username/"
    "Twitter|https://twitter.com/$Username"
    "Facebook|https://www.facebook.com/$Username"
    "LinkedIn|https://www.linkedin.com/in/$Username"
    "Snapchat|https://www.snapchat.com/add/$Username"
    "Pinterest|https://www.pinterest.com/$Username"
    "Reddit|https://www.reddit.com/user/$Username"
    "TikTok|https://www.tiktok.com/@$Username"
    "YouTube|https://www.youtube.com/$Username"
)

# Funktion zur Profilprüfung
check_profile() {
    platform_name=$1
    profile_url=$2

    response_code=$(curl -o /dev/null -s -w "%{http_code}" "$profile_url")

    if [ "$response_code" -eq 200 ]; then
        printf "[$Success]: The username %s exists on %s.\n" "$Username" "$platform_name"
        printf "[$Info]: Profile URL: %s\n" "$profile_url"
    else
        printf "[$Error]: The username %s does not exist on %s.\n" "$Username" "$platform_name"
    fi
}

# Überprüfung auf allen Plattformen
for platform in "${platforms[@]}"; do
    platform_name=$(echo $platform | cut -d'|' -f1)
    profile_url=$(echo $platform | cut -d'|' -f2)
    check_profile "$platform_name" "$profile_url"
done
