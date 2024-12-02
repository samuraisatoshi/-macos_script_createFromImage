#!/bin/zsh

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Clear the screen
clear

# Header
echo "${MAGENTA}"
echo "========================================"
echo "         CREATE BOOT DISK SCRIPT        "
echo "========================================"
echo "${NC}"

# List external drives
echo "${CYAN}Available external drives:${NC}"
diskutil list external physical

# Prompt user to select a drive
echo ""
echo "${YELLOW}Please enter the full identifier of the target drive (e.g., disk2):${NC}"
read "TARGET_DRIVE?Identifier: "

# List available image files
echo ""
echo "${CYAN}Available image files:${NC}"
# Assuming images are in the current directory with .img or .iso extensions
ls *.img *.iso 2>/dev/null

# Prompt user to select an image
echo ""
read "IMAGE_FILE?${YELLOW}Enter the name of the image file to use: ${NC}"

# Confirm action
echo ""
echo "${RED}You have selected to write ${IMAGE_FILE} to /dev/${TARGET_DRIVE}${NC}"
read "CONFIRM?${YELLOW}Are you sure you want to proceed? (yes/no): ${NC}"

if [[ "$CONFIRM" == "yes" ]]; then
    echo "${BLUE}Unmounting /dev/${TARGET_DRIVE}...${NC}"
    diskutil unmountDisk /dev/$TARGET_DRIVE

    echo "${BLUE}Writing image to /dev/r${TARGET_DRIVE}...${NC}"
    sudo dd if="$IMAGE_FILE" of="/dev/r${TARGET_DRIVE}" bs=1m

    echo "${BLUE}Ejecting /dev/${TARGET_DRIVE}...${NC}"
    diskutil eject /dev/$TARGET_DRIVE

    echo "${GREEN}Done.${NC}"
else
    echo "${RED}Operation cancelled.${NC}"
fi
