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

## Resume Structure

1. **Experience section must fit on page 1** - Keep the Experience section concise enough to fit entirely on the first page. Trim or consolidate bullets as needed.

2. **Page break after Experience** - There is a `\pagebreak` in `main.tex` after `sections/experience.tex`. Education and Skills go on page 2.

3. **Projects section is optional** - Only include `sections/projects.tex` when the hobby project is strongly relevant to the target role.

## Language and Style

Key guidelines:

1. **No Oxford commas** - Do not use a comma before "and" or "or" in a list
   - Correct: "Java, Python and C#"
   - Incorrect: "Java, Python, and C#"

2. **Date formats** - Use day-month-year order when dates are written out
