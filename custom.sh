#!/bin/bash

# Create user 'asius' with a home directory, bash shell,
# and set the password to 'asius' (encrypted).
useradd -m -s /bin/bash -p "$(openssl passwd -1 asius)" asius

# Add the new user to standard groups for permissions (recommended)
# This provides permissions for system administration, hardware access, etc.
usermod -aG sudo,adm,video,audio,input,disk,kvm,plugdev,netdev asius