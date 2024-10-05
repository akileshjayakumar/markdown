# Useful Markdown Files and Shell Scripts

Welcome to this repository of useful markdown files and shell scripts. This collection is designed to simplify a variety of tasks, including GPU setup, Docker management, Git configuration, and CUDA installation. Below is a brief overview of the contents of this repository and how to use them.

## Markdown Files

Markdown documentation is located in the `/docs` directory. These files provide instructions for setup and management of various tools and utilities:

- **gpg-key-instructions.md**  
  Detailed instructions for generating and configuring GPG keys, including exporting keys and configuring Git to sign commits.

- **install-git-LFS.md**  
  A step-by-step guide to install and set up Git Large File Storage (LFS), which is essential for versioning large files in Git.

- **useful-docker-commands.md**  
  A reference sheet of commonly used Docker commands. This includes commands for managing containers, images, networks, and services.

- **nvidia-container-toolkit-install.md**  
  Instructions for installing the NVIDIA Container Toolkit, which allows Docker containers to access NVIDIA GPUs. This is essential for CUDA-based applications and machine learning workloads.

## Shell Scripts

The `/sh-files/` directory contains various shell scripts that automate tasks related to CUDA installation, GPG key generation, and more.

- **gpg-key.sh**  
  A script to automate the creation of a GPG key using predefined parameters. You can modify it to include your own details, such as name and email.

- **cuda_install_part1.sh**  
  The first part of a multi-step process to install CUDA and set up a Docker environment for GPU-accelerated applications.

- **cuda_install_part2.sh**  
  The second script in the CUDA installation process. This completes the setup and verifies that CUDA is correctly installed.

### Customization

- **gpg-key.sh**: Modify the script with your personal details before running it to generate a customized GPG key.
- **CUDA Installation Scripts**: Ensure your system meets the necessary requirements, such as having a compatible NVIDIA GPU, before running these scripts.

```

```
