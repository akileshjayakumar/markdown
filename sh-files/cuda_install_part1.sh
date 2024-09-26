read -p "This script will uninstall any existing CUDA configuration and install it again. There will be at least one reboot of the system. Do you wish to continue? (y/n) " answer

# Convert the answer to lowercase
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

# Check the user's answer
if [ "$answer" != "y" ]; then
    echo "Exiting script."
    exit 1
fi

echo "Continuing with script execution..."

# Generic updates
sudo apt-get update

# Install CUDA - good if can automate this but seems like it varies for different computers. Try with laptops once available.
# Reference(s) on how to uninstall CUDA: 
# https://stackoverflow.com/questions/56431461/how-to-remove-cuda-completely-from-ubuntu
# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#removing-cuda-toolkit-and-driver

## Uninstall existing versions of CUDA.
sudo apt-get --purge remove "*cuda*" "*cublas*" "*cufft*" "*cufile*" "*curand*" \
 "*cusolver*" "*cusparse*" "*gds-tools*" "*npp*" "*nvjpeg*" "nsight*" "*nvvm*"
 sudo apt-get --purge remove "*nvidia*" "libxnvctrl*"
 sudo apt-get autoremove

 ## Pre-installation actions
 ### Install GCC
 sudo apt-get install -y gcc

 ## Install kernel headers and development packages.
 sudo apt-get install linux-headers-$(uname -r)

 ## Remove outdated signing key.
 sudo apt-key del 7fa2af80

 ## Install CUDA Toolkit - via network.
 wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
 sudo dpkg -i cuda-keyring_1.1-1_all.deb
 sudo apt-get update
 sudo apt-get -y install cuda-toolkit-12-4
 sudo apt-get install nvidia-gds


 ## Install CUDA drivers
 sudo apt-get install -y cuda-drivers

 ## Install Docker Engine
 VERSION_STRING=5:26.1.2-1~ubuntu.22.04~jammy
 for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
 sudo apt-get update
 sudo apt-get install ca-certificates curl
 sudo install -m 0755 -d /etc/apt/keyrings
 sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
 sudo chmod a+r /etc/apt/keyrings/docker.asc
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
 sudo apt-get update
 sudo apt-get install docker-ce=$VERSION_STRING docker-ce-cli=$VERSION_STRING containerd.io docker-buildx-plugin docker-compose-plugin
 echo "Adding current user to the Docker group..."
 sudo usermod -aG docker $USER



 ## Install NVIDIA Container Toolkit - to be able to run with Docker.
 curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

#  sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list

 sudo apt-get update
 sudo apt-get install -y nvidia-container-toolkit

 ## Configure Docker
 sudo nvidia-ctk runtime configure --runtime=docker
 sudo systemctl restart docker

 # Post-installation - pls run unofficial-cuda-install-part2.sh


