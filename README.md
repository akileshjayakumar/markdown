# Linux Setup Scripts and Notes
Helper scripts and docs for Ubuntu-based GPU workstation setup: CUDA 12.4, Docker with NVIDIA runtime, GPG commit signing, and Git LFS.

## Quick Start
```bash
git clone https://github.com/akileshjayakumar/markdown
cd markdown
```

## Capabilities
- Ubuntu 22.04 (or compatible Debian-based distro)
- NVIDIA GPU with working driver (`nvidia-smi`)
- `bash`, `git`, `gpg`, `curl`, and `sudo` access
- `scripts/cuda_install_part1.sh`: reinstalls CUDA stack and configures Docker + NVIDIA runtime.

## Configuration
- No required environment variables are documented for basic usage.

## Usage
```bash
ls -la
```

## Contributing and Testing
- Contributions are welcome through pull requests with clear, scoped changes.
- No automated test suite is currently documented for this repository.

## License
Licensed under the `MIT` license. See [LICENSE](./LICENSE) for full text.
