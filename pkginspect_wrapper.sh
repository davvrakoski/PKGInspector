#!/bin/bash

# Detect which AUR helper is being used
if command -v paru &>/dev/null; then
    AUR_HELPER="paru"
elif command -v yay &>/dev/null; then
    AUR_HELPER="yay"
else
    echo "No AUR helper found (yay/paru)"
    exit 1
fi

# Only intercept -S, pass everything else straight through
if [[ "$1" != "-S" ]]; then
    exec $AUR_HELPER "$@"
fi

# For each package after -S
for pkg in "${@:2}"; do
    # Check if AUR package
    if ! pacman -Si "$pkg" &>/dev/null; then
        echo "=== PKGInspect: AUR package '$pkg' detected ==="
        PKGInspect "$pkg"
    else
        # Official repo, pass straight to helper
        $AUR_HELPER -S "$pkg"
    fi
done
