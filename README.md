# Markdown Guides and Scripts

Linux-first setup notes and helper scripts for CUDA, Docker + NVIDIA runtime, GPG signing, and Git LFS.

## Quick Start

### Prerequisites
- Ubuntu 22.04 (or compatible Debian-based distro for the CUDA scripts)
- NVIDIA GPU + driver
- `bash`, `gpg`, `git`, and `sudo` access

### Setup
```bash
git clone <your-repo-url>
cd markdown
chmod +x scripts/*.sh
```

### Run
```bash
# 1) Configure GPG key template (edit name/email first)
gpg --batch --generate-key scripts/gpg-key.sh

# 2) CUDA and Docker runtime install (interactive + reboot required)
bash scripts/cuda_install_part1.sh
bash scripts/cuda_install_part2.sh
```

## Features
- GPG key template for commit-signing setup.
- Two-part CUDA + Docker/NVIDIA container runtime install flow.
- Ready-to-scan docs for Git LFS, Docker commands, and NVIDIA toolkit setup.

## Configuration
- `scripts/gpg-key.sh`: set `Name-Real`, `Name-Email`, and optional `Name-Comment` before key generation.

## Usage
```bash
# Verify GPU and CUDA toolchain after setup
nvidia-smi
nvcc --version

# Verify Docker can access GPU
sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

Docs for each workflow are in:
- `docs/gpg-key-instructions.md`
- `docs/install-git-LFS.md`
- `docs/useful-docker-commands.md`
- `docs/nvidia-container-toolkit-install.md`

## Contributing and Testing
```bash
# Check shell syntax quickly
bash -n scripts/gpg-key.sh
bash -n scripts/cuda_install_part1.sh
bash -n scripts/cuda_install_part2.sh
```

Open a PR with any fixes to scripts or docs and include the distro/GPU tested.

## License
Licensed under the `MIT` license. See [LICENSE](./LICENSE) for full text.
