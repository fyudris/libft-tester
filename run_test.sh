#!/bin/bash

# Check if Gum is installed, otherwise download it temporarily
if ! command -v gum &>/dev/null; then
    echo "Gum is not installed. Downloading..."
    OS="Linux"
    ARCH=$(uname -m)

    # Map architecture to Gum's naming convention
    if [[ "$ARCH" == "x86_64" ]]; then
        ARCH="x86_64"
    elif [[ "$ARCH" == "arm64" ]]; then
        ARCH="arm64"
    else
        echo "Unsupported architecture: $ARCH"
        exit 1
    fi

    # Download Gum binary tarball
    curl -sLo gum.tar.gz https://github.com/charmbracelet/gum/releases/download/v0.14.5/gum_0.14.5_Linux_${ARCH}.tar.gz

    # Extract the tarball
    tar -xzf gum.tar.gz

    # Find the gum binary inside the extracted folder
    GUM_DIR=$(tar -tzf gum.tar.gz | head -1 | cut -f1 -d"/")
    if [[ -d "$GUM_DIR" ]]; then
        mv "$GUM_DIR/gum" .
    else
        echo "Error: Could not find the gum binary after extraction."
        rm -f gum.tar.gz
        exit 1
    fi

    # Clean up tarball and extracted folder
    rm -rf gum.tar.gz "$GUM_DIR"

    # Ensure the binary is executable
    chmod +x gum
fi

GUM="./gum"

# Example usage of Gum
LIBFT_PATH=$($GUM input --placeholder "Enter the path to your Libft project")
if [[ ! -f "$LIBFT_PATH/libft.h" ]]; then
    $GUM style --foreground red "Error: libft.h not found in $LIBFT_PATH!"
    rm -f ./gum
    exit 1
fi




echo "Libft project located at: $LIBFT_PATH"


















rm -f ./gum # Clean up the Gum binary if downloaded temporarily
