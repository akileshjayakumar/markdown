# Installing the NVIDIA Container Toolkit

The NVIDIA Container Toolkit allows Docker containers to leverage NVIDIA GPUs, making it essential for running GPU-accelerated applications, such as those utilizing CUDA. Follow the steps below to set up the toolkit on your system.

## Prerequisites

Before installing the NVIDIA Container Toolkit, ensure the following are in place:

- A CUDA-capable NVIDIA GPU.
- Docker installed on your system. You can follow the official Docker installation guide [here](https://docs.docker.com/get-docker/).
- The correct NVIDIA driver installed. You can verify driver installation with the command:
  
  ```bash
  nvidia-smi
  ```

If the drivers are properly installed, this command will display information about your GPU.

## Steps to Install the NVIDIA Container Toolkit

### 1. Configure the NVIDIA Container Toolkit Repository

Run the following command to add the NVIDIA Container Toolkit repository and GPG key:

```bash
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
```

### 2. Update the Package List

Update the package lists from the newly added repository:

```bash
sudo apt-get update
```

### 3. Install the NVIDIA Container Toolkit

Now, install the NVIDIA Container Toolkit with the following command:

```bash
sudo apt-get install -y nvidia-container-toolkit
```

### 4. Configure Docker to Use NVIDIA Runtime

Use the `nvidia-ctk` tool to configure Docker to use the NVIDIA container runtime:

```bash
sudo nvidia-ctk runtime configure --runtime=docker
```

### 5. Restart Docker

After configuring the runtime, restart the Docker service:

```bash
sudo systemctl restart docker
```

### 6. Verify the Installation

You can verify that the setup is working by running a container that uses NVIDIA GPUs. For instance, run the following command to check if the GPU is accessible:

```bash
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

If everything is configured correctly, you should see the details of your GPU displayed in the output.

## Additional Notes

- For advanced users, it's possible to configure the repository for experimental features and packages by enabling the experimental repository.
- The toolkit also supports container engines like `containerd`, `CRI-O`, and `Podman` in addition to Docker.

For more detailed documentation, visit the official NVIDIA Container Toolkit installation guide [here](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html).

## Conclusion

After completing these steps, your Docker containers should now be able to use NVIDIA GPUs for running GPU-accelerated workloads, making it possible to use applications such as CUDA and deep learning frameworks seamlessly within containers.