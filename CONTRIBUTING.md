# Contributing

Thanks for your interest in improving this project!

## Reporting issues

Open a GitHub issue and include:

- Your operating system and `pandoc --version` output
- The command you ran
- The full error message or a description of what went wrong
- If possible, a small sample `.docx` or `.odt` that reproduces the problem

## Suggesting changes

1. Fork the repository and create a branch (`git checkout -b my-change`).
2. Make your change. Keep the script POSIX-friendly Bash and run it through [ShellCheck](https://www.shellcheck.net/) if you can.
3. Test it on a folder containing both `.docx` and `.odt` files.
4. Commit, push, and open a pull request describing what you changed and why.

## Ideas welcome

- A native PowerShell version for Windows
- Options for output folder, or for body-only (no preamble) output
- Support for additional input formats
