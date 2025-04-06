# helpers.sh

# This script contains helper functions for setting up the environment
check_and_install_program() {
    local program=$1
    local install_command=$2

    if ! command -v "$program" &> /dev/null; then
        echo "$program not found. Installing..."
        eval "$install_command"
    else
        echo "$program is already installed."
    fi
}

add_shared_config_line() {
    local line=$1
    local file=$2

    if ! grep -qxF "$line" "$file"; then
        echo "$line" >> "$file"
        echo "Added line to $file"
    else
        echo "Line already exists in $file"
    fi
}

check_and_install_pip3() {
    if ! command -v pip3 &> /dev/null; then
        echo "pip3 is not installed. Installing pip3..."
        
        # Update package list and install pip3
        sudo apt update
        sudo apt install -y python3-pip
        
        if command -v pip3 &> /dev/null; then
            echo "pip3 has been successfully installed."
        else
            echo "Failed to install pip3."
        fi
    else
        echo "pip3 is already installed."
    fi
}
