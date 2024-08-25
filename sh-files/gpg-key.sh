%no-protection
%echo Generating a basic OpenPGP key

# Key specifications
Key-Type: RSA
Key-Length: 4096
Subkey-Type: RSA
Subkey-Length: 4096

# User information
Name-Real: [Your Full Name]
Name-Comment: [Optional Comment]
Name-Email: [your_email@example.com]

# Expiration date (0 means no expiration)
Expire-Date: 0

%commit
%echo done

