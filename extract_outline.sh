#!/usr/bin/env bash
# ------------------------------------------------------------------------------
# extract_outline.sh
#
# Wrapper for extract_outline.py.
# Activates the pptx-tools virtual environment before running the script.
#
# Usage:
#   extract_outline input.pptx [output.md]
#
# If output.md is omitted, the output defaults to "<stem>.export.md"
# (e.g. talk_r3.pptx -> talk_r3.export.md). The ".export.md" suffix marks the
# file as a machine-generated export tied to its source .pptx, keeping it
# distinct from hand-written working drafts that share the same stem.
# ------------------------------------------------------------------------------

SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
VENV="${HOME}/venvs/pptx-tools"

if [[ -f "${VENV}/bin/activate" ]]; then
    source "${VENV}/bin/activate"
fi

exec python "${SCRIPT_DIR}/extract_outline.py" "$@"
