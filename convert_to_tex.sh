#!/usr/bin/env bash
# convert_to_tex.sh
# Converts every .docx and .odt file in a folder to a LaTeX .tex file.
# Output files are written next to the originals; the originals are left untouched.
#
# Needs:  pandoc  (https://pandoc.org/installing.html)
#
# DIRECTIONS:
#   1. Make the script executable (one time only):
#        chmod +x convert_to_tex.sh
#   2. Run it on the default folder (~/Downloads/Convert):
#        ./convert_to_tex.sh
#   3. Or run it on any other folder:
#        ./convert_to_tex.sh /path/to/folder
#   (Or skip step 1 and run: bash convert_to_tex.sh)

set -euo pipefail

SRC_DIR="${1:-$HOME/Downloads/Convert}"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Folder not found: $SRC_DIR" >&2
  exit 1
fi

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Please install pandoc first (e.g. 'brew install pandoc' or 'sudo apt install pandoc')." >&2
  exit 1
fi

shopt -s nullglob nocaseglob
files=("$SRC_DIR"/*.docx "$SRC_DIR"/*.odt)

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No .docx or .odt files found in $SRC_DIR"
  exit 0
fi

count=0
for f in "${files[@]}"; do
  out="${f%.*}.tex"
  # -s makes a complete, compilable document (preamble + \begin{document});
  # embedded images are extracted into a folder next to the .tex file.
  pandoc "$f" -s -t latex --extract-media="${f%.*}_media" -o "$out"
  echo "Converted: $(basename "$f") -> $(basename "$out")"
  count=$((count + 1))
done

echo "Done. $count file(s) converted."
