# Agent Guidelines

## Hard Rules — Devcontainer Only

- **Run every LaTeX build and tool command inside the devcontainer** via `.devcontainer/exec.sh <cmd>`.
- **Never run `xelatex`, `pdflatex`, `latexmk`, or builds on the host system.** You may edit source files on the host (the repository is bind-mounted at `/workspace` in the container), but all execution must happen in the slim TeX Live 2026 container.
- `.devcontainer/exec.sh` locates the running container by the `devcontainer.local_folder` Docker label. If stopped, it starts the existing container; if none exists yet, it builds `.devcontainer/Dockerfile` and starts the container automatically.

## PDF Generation

Compile the resume inside the devcontainer using `xelatex`:

```bash
.devcontainer/exec.sh xelatex -interaction=nonstopmode main.tex
```

Both `.vscode/tasks.json` and the GitHub Actions composite action (`.github/actions/compile-latex/action.yml`) delegate PDF compilation to `.devcontainer/exec.sh xelatex -interaction=nonstopmode main.tex`.

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
