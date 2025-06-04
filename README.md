# Markdown Guides and Scripts

This repository offers markdown guides and shell scripts for GPU setup, Docker management, Git configuration, and CUDA installation.

## Documentation

All guides live in `/docs`:

- **gpg-key-instructions.md** – generate and configure GPG keys and sign commits.
- **install-git-LFS.md** – install Git Large File Storage.
- **useful-docker-commands.md** – reference of common Docker commands.
- **nvidia-container-toolkit-install.md** – install the NVIDIA Container Toolkit.

## Shell Scripts

Scripts are in `/scripts`:

- **gpg-key.sh** – create a GPG key (update with your name and email).
- **cuda_install_part1.sh** – start CUDA installation and prepare Docker for GPU workloads.
- **cuda_install_part2.sh** – finish CUDA setup and verify installation.

### Customization

- Edit `gpg-key.sh` with your own details.
- Confirm you have a compatible NVIDIA GPU before running the CUDA scripts.
