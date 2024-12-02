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


cd ./src || exit 1 
dotnet --version | grep -q '[7-9]'
if [ $? -eq 0 ]; then
    echo -e "[$Success]: Dotnet is installed"
else
    echo -e "[$Error]: Dotnet is not installed"
    exit 1
fi

dotnet add package HtmlAgilityPack | grep -q 'Restored'
if [ $? -eq 0 ]; then
    echo -e "[$Success]: HtmlAgilityPack is installed"
else
    echo -e "[$Error]: HtmlAgilityPack is not installed"
    exit 1
fi


dotnet build | grep -q 'succeeded' 
# shellcheck disable=SC2181
if [ $? -eq 0 ]; then
    # shellcheck disable=SC2059
    printf "[$Success]: Build is successful\n"
else
    # shellcheck disable=SC2059
    printf "[$Error]: Build has failed\n"
    exit 1
fi
