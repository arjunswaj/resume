#!/usr/bin/env bash
# Run a command in the resume-latex devcontainer.
#
# Finds a running VS Code / devcontainer CLI container for this folder by its
# `devcontainer.local_folder` label. If a stopped container exists, starts it;
# if no container exists yet, builds the slim TeX Live image from
# .devcontainer/Dockerfile and starts a detached container with the same label.
set -euo pipefail

LABEL=devcontainer.local_folder
FOLDER="$(cd "$(dirname "$0")/.." && pwd)"
IMAGE_NAME="resume-latex-dev:local"
CONTAINER_NAME="resume-latex-dev"

current=$(docker ps --filter "label=$LABEL=$FOLDER" --format '{{.Names}}' | head -n1 || true)

if [ -z "$current" ]; then
    stopped=$(docker ps -a --filter "label=$LABEL=$FOLDER" --format '{{.Names}}' | head -n1 || true)
    if [ -n "$stopped" ]; then
        echo "Starting stopped devcontainer '$stopped'..." >&2
        docker start "$stopped" >/dev/null
        current="$stopped"
    else
        echo "Building and starting devcontainer '$CONTAINER_NAME' ($IMAGE_NAME)..." >&2
        docker build -t "$IMAGE_NAME" -f "$FOLDER/.devcontainer/Dockerfile" "$FOLDER/.devcontainer" >&2
        docker run -d \
            --name "$CONTAINER_NAME" \
            --init \
            --label "$LABEL=$FOLDER" \
            -v "$FOLDER:/workspace" \
            -w /workspace \
            "$IMAGE_NAME" \
            sleep infinity >/dev/null
        current="$CONTAINER_NAME"
    fi
fi

# Mirror caller's subdirectory inside the repo unless overridden with --dir.
case "$PWD" in
    "$FOLDER")   WORKDIR=/workspace ;;
    "$FOLDER"/*) WORKDIR="/workspace/${PWD#"$FOLDER"/}" ;;
    *)           WORKDIR=/workspace ;;
esac

mode=direct
while :; do
    case "${1:-}" in
        --interactive)
            mode=interactive
            shift
            ;;
        --dir)
            WORKDIR="${2:?--dir needs a path}"
            shift 2
            ;;
        *)
            break
            ;;
    esac
done
case "$WORKDIR" in /*) ;; *) WORKDIR="/workspace/$WORKDIR" ;; esac

if [ "$mode" = "interactive" ] || [ "$#" -eq 0 ]; then
    if [ "$#" -eq 0 ]; then set -- bash; fi
    exec docker exec -it -w "$WORKDIR" "$current" bash -c 'exec "$@"' _ "$@"
fi

exec docker exec -i -w "$WORKDIR" "$current" bash -c 'exec "$@"' _ "$@"
