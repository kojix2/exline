# Exline

[![CI](https://github.com/kojix2/exline/actions/workflows/ci.yml/badge.svg)](https://github.com/kojix2/exline/actions/workflows/ci.yml)

Exline is a command-line utility that extracts and prints specific lines or a range of lines from a text file, based on a specified pattern.

## Usage

```
exline [pattern] [options] [file1 file2 ...]
```

The first non-option argument is the pattern, which should be a valid Ruby range expression (e.g., 3..5 or 2...6) or a comma-separated list of line numbers (e.g., 3,4,5). The options are used to customize the behavior of Exline, and the remaining arguments are the input file(s).

If no files are specified, Exline reads from standard input.

## Options

```
-s, --sep=SEPARATOR
    Specify the line separator (default: \n)

-h, --help
    Show the help message and exit
```

Examples

Extract and print lines 3 to 5 from a file:

```
exline 3..5 myfile.txt
```

Extract and print lines 3, 4, and 5 from a file:

```
exline 3,4,5 myfile.txt
```

Extract and print lines 2 to 5 from multiple files:

```
exline 2..5 file1.txt file2.txt
```

Extract and print lines 2 to 5, using a custom line separator:

```
exline 2..5 -s "\r\n" myfile.txt
```

Extract and print lines 3 to 5 from standard input:

```
cat myfile.txt | exline 3..5
```

Extract and print lines 2, 3, 4, and 6 to 10 from a file:

```
exline 2,3,4,6..10 myfile.txt
```

Installation

Download the exline script and make it executable:

```
chmod +x exline
```

Move the exline script to a directory in your PATH, e.g.:

```
mv exline /usr/local/bin/
```

License

Exline is released under the MIT License.

---

Hello, my name is kojix2, a human being. This code was mostly created by ChatGPT. And this README itself!
