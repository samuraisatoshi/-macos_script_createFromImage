# Create Boot Disk Script

## Purpose

This script is designed to help users create a bootable disk from an image file on macOS. It lists available external drives and image files, allowing the user to select the desired options.


## Exclusivity to macOS

This script is specifically designed for macOS, utilizing the `diskutil` command to manage drives. It will not work on Linux distributions without modification.

## Adapting for Linux

To use this script on a Linux distribution, you need to replace macOS-specific commands with Linux equivalents:

- **List Drives**: Use `lsblk` instead of `diskutil list`.
- **Unmount Drives**: Use `umount` instead of `diskutil unmountDisk`.
- **Eject Drives**: Use `eject` or `udisksctl power-off` instead of `diskutil eject`.

### Expected Differences

- **Command Syntax**: Linux commands may have different options and syntax.
- **Drive Identifiers**: Linux uses `/dev/sdX` format instead of `/dev/diskX`.

## Usage

1. **Make the Script Executable**: Run the following command to make the script executable:
   ```bash
   chmod +x create_boot_disk.sh
   ```

2. **Run the Script**: Execute the script using the command:
   ```bash
   ./create_boot_disk.sh
   ```

3. **Select a Drive**: The script will list available external drives. Enter the full identifier of the target drive (e.g., `disk2`).

4. **Select an Image**: The script will list available image files in the current directory. Enter the name of the image file you wish to use.

5. **Confirm the Action**: The script will ask for confirmation before proceeding. Type `yes` to continue or `no` to cancel.

## What to Avoid

- **Incorrect Drive Selection**: Ensure you select the correct drive identifier. Writing to the wrong drive can result in data loss.

## Risks

- **Data Loss**: Using the wrong drive identifier will overwrite the data on that drive. Double-check your selections before confirming.

## Disclaimer

This script is provided "as is" without any warranty. The user assumes all risks associated with its use. The author is not responsible for any damage or data loss resulting from the use of this script.

## Publishing

You may publish this script and README.md file in a public GitHub repository.
