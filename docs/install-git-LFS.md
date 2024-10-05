# Git Large File Storage (Git LFS)

Git LFS is a command line extension for managing large files with Git. It replaces large files with text pointers inside your Git repository while storing the actual file contents separately.

## Installation

### Linux

#### Debian-based Distributions (Ubuntu, etc.)

To install Git LFS on Debian-based distributions, run:

```bash
sudo apt-get install git-lfs
```

#### Red Hat-based Distributions (Fedora, CentOS, etc.)

For Red Hat-based distributions, you can use either `dnf` or `yum`:

```bash
sudo dnf install git-lfs
```
or
```bash
sudo yum install git-lfs
```

### macOS

To install Git LFS on macOS using Homebrew:

```bash
brew install git-lfs
```

## Post-installation Setup

After installing Git LFS, you need to run the following command to configure it globally:

```bash
git lfs install
```

This step ensures Git is configured to work with LFS in all repositories.

## Usage

Once Git LFS is installed and configured, you can begin tracking large files in your repository.

### Tracking Files with Git LFS

To track specific file types (for example, all `.psd` files), use the `git lfs track` command inside your repository:

```bash
git lfs track "*.psd"
```

This will create or update the `.gitattributes` file in your repository. You should commit this change:

```bash
git add .gitattributes
git commit -m "Track PSD files using Git LFS"
```

### Adding and Committing Files

You can now add and commit large files as you normally would:

```bash
git add myfile.psd
git commit -m "Add my PSD file"
```

### Pushing to a Remote Repository

Push your changes to a remote repository as usual. Git LFS will handle the large files automatically:

```bash
git push origin main
```

### Verifying Tracked Files

To verify that Git LFS is tracking your files, run:

```bash
git lfs ls-files
```

## Migrating Existing Files to Git LFS

If you have large files already in your Git repository's history, you can migrate them to Git LFS using the following command:

```bash
git lfs migrate import --include="*.psd" --everything
```

> ⚠️ **Note:** This operation will rewrite your repository history and change Git object IDs.

## Uninstalling Git LFS

If you decide to stop using Git LFS and want to convert your repository back to plain Git, you can use the following command:

```bash
git lfs migrate export --include="*.psd" --everything
```

## Need Help?

- For additional help, refer to the [official Git LFS documentation](https://git-lfs.github.com).
- If you run into issues or need help with specific commands, you can get help by running:

```bash
git lfs help <subcommand>
```
