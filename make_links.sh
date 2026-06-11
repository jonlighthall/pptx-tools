#!/bin/bash -u
# ------------------------------------------------------------------------------
# make_links.sh for pptx-tools
#
# Creates symlinks from ~/bin to scripts in this repo.
# Assumes extract_outline.py is executable.
#
# Usage:
#   cd ~/utils/pptx-tools
#   bash make_links.sh
#
# Or source it from elsewhere:
#   source ~/utils/pptx-tools/make_links.sh
# ------------------------------------------------------------------------------

set -e

# Get starting directory
start_dir=$PWD

# Determine the repo directory (where this script lives)
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Create ~/bin if it doesn't exist
mkdir -pv "${HOME}/bin"

echo "Linking pptx-tools executables..."

# Make extract_outline.py executable
chmod +x "${script_dir}/extract_outline.py"

# Create symlink in ~/bin
link_target="${HOME}/bin/extract_outline"
source_file="${script_dir}/extract_outline.py"

if [ -L "$link_target" ]; then
    echo "Removing old symlink: $link_target"
    rm "$link_target"
fi

ln -sv "$source_file" "$link_target"
echo "Linked: extract_outline"

echo "Done. You can now use: extract_outline input.pptx output.md"
