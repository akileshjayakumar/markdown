#!/bin/bash
# This script helps to do the post-installation actions for CUDA installation. 
# It is simply for convenience and does NOT handle unexpected errors or changes in versions. 
# Do refer to the official CUDA installation guide on NVIDIA's website for more detailed instructions.
# Instructions on how to run:
# 1. Make this executable with: chmod +x /path/to/this/sh
# 2. Run: /path/to/this/sh

# !!!!!!IMPORTANT!!!!!!!!!!!!! 
# Assumed prerequisites: Ubuntu 22.04 on an x86_64 system.
# If this .sh does not work, go to the following site and follow the steps to do installation: https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
# This assumes you have run unofficial-cuda-install-part1.sh and it has successfully completed.
# !!!!!!IMPORTANT!!!!!!!!!!!!! 



# Warning message before continuing with the script.
read -p "This script will perform post-installation actions for CUDA. There will be at least one reboot of the system. Do you wish to continue? (y/n) " answer

# Convert the answer to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check the user's answer
if [ "$answer" != "y" ]; then
    echo "Exiting script."
    exit 1
fi

echo "Continuing with script execution..."

# Environment setup.
# Append CUDA environment variables to .bashrc
echo "Adding CUDA environment variables to .bashrc..."

{
    echo ""
    echo "# CUDA Environment Variables"
    echo "export PATH=/usr/local/cuda-12.4/bin\${PATH:+:\${PATH}}"
    echo "export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64\${LD_LIBRARY_PATH:+:\${LD_LIBRARY_PATH}}"
} >> ~/.bashrc

echo "CUDA environment variables added to .bashrc successfully."

# POWER9 setup.
# sudo systemctl enable nvidia-persistenced

# Please refer to the official NVIDIA CUDA installation site for the post-installation actions if this script does not work for you.
