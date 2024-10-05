# GPG Key Setup and Git Configuration Guide

This guide will walk you through the process of generating a GPG key, exporting it, adding it to your GitLab account, and configuring Git to use the key for signing commits.

## Step 1: Generate Your GPG Key

1. **Make the GPG script executable:**
   ```bash
   chmod +x /path/to/gpg-key.sh
   ```
   _This command makes the `gpg-key.sh` script executable, allowing it to be run as a program._

2. **Generate the GPG key:**
   ```bash
   gpg --batch --generate-key gpg-key.sh
   ```
   _Generates a GPG key using the parameters specified in the `gpg-key.sh` script. This key will be used for signing your Git commits._

## Step 2: Export Your GPG Key

1. **Export your public GPG key:**
   ```bash
   gpg --armor --export your_email@example.com
   ```
   _Exports your public GPG key in an armored format, which is suitable for sharing or adding to services like GitLab._

2. **Copy the public key output:**
   - _The exported key will be displayed in the terminal, looking something like this:_
   ```
   -----BEGIN PGP PUBLIC KEY BLOCK-----
   ...
   -----END PGP PUBLIC KEY BLOCK-----
   ```
   _Copy this entire block, as you will need it in the next step._

## Step 3: Add the GPG Key to Your GitLab Account

1. **Log in to your GitLab account:**
   - Go to your GitLab profile settings.
   - Navigate to the "GPG Keys" section.
   - Paste the public key you copied in the previous step into the "Add GPG Key" field.
   - Save the key to link it with your GitLab account.

## Step 4: Configure Git to Use Your GPG Key

1. **List your GPG secret keys to find your key ID:**
   ```bash
   gpg --list-secret-keys --keyid-format LONG
   ```
   _This command lists all your secret GPG keys along with their associated IDs._

2. **Identify your GPG key ID:**
   - Look for the key ID, which appears as a long string after `sec`, for example, `70EEA4815B3FB9ED`.

3. **Configure Git to use your GPG key:**
   ```bash
   git config --global user.signingkey 70EEA4815B3FB9ED
   ```
   _Sets your GPG key as the default key for signing commits in Git._

4. **Set Git to sign all commits by default:**
   ```bash
   git config --global commit.gpgSign true
   ```
   _This configuration ensures that all your commits are signed automatically with your GPG key._

## Step 5: Sign and Push Your Commit

1. **Amend your last commit to include a GPG signature:**
   ```bash
   git commit --amend --no-edit -S
   ```
   _If you’ve already made a commit and forgot to sign it, this command allows you to amend the last commit by adding your GPG signature._

2. **Push your signed commit to GitLab:**
   ```bash
   git push origin your-branch:your-branch
   ```
   _Pushes your signed commit to the specified branch on your GitLab repository._

## Summary

By following these steps, you will successfully generate a GPG key, export it, and configure Git to sign your commits with this key. Signing commits enhances the security and authenticity of your contributions.

## Troubleshooting

- **Common Issue**: If you encounter errors during GPG key generation, ensure that the `gpg-key.sh` script is executable and correctly formatted. Verify that all required parameters are properly set within the script.

---
