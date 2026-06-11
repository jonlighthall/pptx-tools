#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# extract_outline.sh
#
# Wrapper for extract_outline.py.
# Activates the pptx-tools virtual environment before running the script.
#
# Usage:
#   extract_outline input.pptx [output.md]
# ------------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV="${HOME}/venvs/pptx-tools"

if [[ -f "${VENV}/bin/activate" ]]; then
    source "${VENV}/bin/activate"
fi

exec python "${SCRIPT_DIR}/extract_outline.py" "$@"
