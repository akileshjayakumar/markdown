# Useful Markdown Files and Shell Scripts Repository

This repository contains a collection of useful markdown files and shell scripts that can help streamline various tasks, such as GPG key setup, Docker management, and CUDA installation.

## Table of Contents

- [Overview](#overview)
- [Contents](#contents)
  - [Markdown Files](#markdown-files)
  - [Shell Scripts](#shell-scripts)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## Overview

The purpose of this repository is to provide helpful documentation and scripts that can be easily reused across different projects. Whether you need to set up a GPG key, manage Docker containers, or install CUDA, this repository has you covered.

## Contents

### Markdown Files

- **gpg-key-instructions.md**: Detailed instructions on how to generate a GPG key, export it, and configure Git to sign your commits.
- **useful-docker-commands.md**: A collection of essential Docker commands for managing containers, images, and Docker services.

### Shell Scripts

Located in the `sh-files/` directory:

- **gpg-key.sh**: A script to generate a GPG key using predefined parameters. Customize it with your own information.
- **unofficial-cuda-install-part1-and-docker.sh**: Script to help with the first part of CUDA installation and Docker setup.
- **unofficial-cuda-install-part2.sh**: The continuation script for the second part of CUDA installation.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/akileshjayakumar/useful-md-files.git
   cd useful-md-files
   ```

2. **Using Markdown Files**:
   - Navigate to the markdown file of your choice and follow the instructions provided.

3. **Running Shell Scripts**:
   - Navigate to the `sh-files/` directory.
   - Make the script executable:
     ```bash
     chmod +x script-name.sh
     ```
   - Run the script:
     ```bash
     ./script-name.sh
     ```

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
