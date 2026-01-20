# Agent Guidelines

## PDF Generation

On macOS, use `xelatex` to compile the resume:

```bash
eval "$(/usr/libexec/path_helper)" && xelatex -interaction=nonstopmode main.tex
```

Refer to `.vscode/tasks.json` for platform-specific build commands:
- **macOS**: `xelatex`
- **Linux**: `pdflatex`
- **Windows**: `pdflatex`

## Language and Style

Key guidelines:

1. **No Oxford commas** - Do not use a comma before "and" or "or" in a list
   - Correct: "Java, Python and C#"
   - Incorrect: "Java, Python, and C#"

2. **Date formats** - Use day-month-year order when dates are written out
