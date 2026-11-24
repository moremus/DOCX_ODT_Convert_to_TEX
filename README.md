# DOCX_ODT_Convert_to_TEX - For Linux Mint and Zorin Operating Systems

A small Bash script that converts every `.docx` and `.odt` file in a folder into a LaTeX `.tex` file, using [pandoc](https://pandoc.org/).

- Converts all `.docx` and `.odt` files in one run (extensions are matched case-insensitively).
- Writes each `.tex` file next to its original; originals are never modified.
- Produces complete, compilable LaTeX documents (preamble included).
- Extracts embedded images into a `<filename>_media` folder beside each `.tex` file.

## Requirements

- Linux, macOS, or Windows via WSL / Git Bash
- [pandoc](https://pandoc.org/installing.html)

Install pandoc:

```bash
# Debian / Ubuntu / Linux Mint
sudo apt update && sudo apt install pandoc

# macOS (Homebrew)
brew install pandoc
```

Check that it is installed:

```bash
pandoc --version
```

## Usage

1. Clone the repository (or download the script):

   ```bash
   git clone https://github.com/moremus/DOCX_ODT_Convert_to_TEX.git
   cd DOCX_ODT_Convert_to_TEX
   ```

2. Make the script executable (one time only):

   ```bash
   chmod +x convert_to_tex.sh
   ```

3. Put your `.docx` and `.odt` files in `~/Downloads/Convert`, then run:

   ```bash
   ./convert_to_tex.sh
   ```

To convert a different folder, pass it as an argument:

```bash
./convert_to_tex.sh /path/to/your/folder
```

Example output:

```
Converted: report.docx -> report.tex
Converted: notes.odt -> notes.tex
Done. 2 file(s) converted.
```

## Windows

`.sh` scripts do not run natively on Windows. Two options:

- **WSL:** install pandoc inside WSL and pass the Windows folder path, e.g. `./convert_to_tex.sh /mnt/c/Users/<YourName>/Downloads/Convert`.
- **Git Bash:** install the Windows version of pandoc (`winget install pandoc`) and make sure it is on your PATH.

A native PowerShell version may be added in the future.

## Notes

- Conversion quality depends on pandoc. Complex layouts, text boxes, and some tables may need manual cleanup in the `.tex` output.
- To get only the document body (no preamble), for pasting into your own LaTeX file, remove the `-s` flag from the `pandoc` line in the script.

## Contributing

Issues and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

Released under the [MIT License](LICENSE).
