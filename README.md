# Linux Setup Scripts and Notes

Helper scripts and docs for Ubuntu-based GPU workstation setup: CUDA 12.4, Docker with NVIDIA runtime, GPG commit signing, and Git LFS.

## Quick Start

### Prerequisites
- Ubuntu 22.04 (or compatible Debian-based distro)
- NVIDIA GPU with working driver (`nvidia-smi`)
- `bash`, `git`, `gpg`, `curl`, and `sudo` access

### Clone and prepare
```bash
git clone <your-repo-url>
cd markdown
chmod +x scripts/*.sh
```

### Fast path
```bash
# 1) Customize key identity fields first, then generate a GPG key
gpg --batch --generate-key scripts/gpg-key.sh

# 2) Install CUDA + Docker + NVIDIA container runtime (interactive)
bash scripts/cuda_install_part1.sh

# 3) Apply CUDA PATH/LD_LIBRARY_PATH updates
bash scripts/cuda_install_part2.sh
```

## Core Capabilities
- `scripts/cuda_install_part1.sh`: reinstalls CUDA stack and configures Docker + NVIDIA runtime.
- `scripts/cuda_install_part2.sh`: appends CUDA environment variables to `~/.bashrc`.
- `scripts/gpg-key.sh`: batch template for generating a 4096-bit RSA OpenPGP key.
- `docs/`: focused how-tos for Git LFS, Docker commands, NVIDIA toolkit, and GPG setup.

## Configuration
- Edit `scripts/gpg-key.sh` before running:
  - `Name-Real`
  - `Name-Email`
  - `Name-Comment` (optional)

## Usage
```bash
# Validate CUDA and GPU visibility
nvidia-smi
nvcc --version

# Validate Docker GPU access
docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi
```

## Contributing and Testing
```bash
bash -n scripts/gpg-key.sh
bash -n scripts/cuda_install_part1.sh
bash -n scripts/cuda_install_part2.sh
```

Open a PR with the distro/GPU you validated on.

## Docs
- `docs/gpg-key-instructions.md`
- `docs/install-git-LFS.md`
- `docs/nvidia-container-toolkit-install.md`
- `docs/useful-docker-commands.md`

## License
Licensed under the `MIT` license. See [LICENSE](./LICENSE) for full text.
