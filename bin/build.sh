#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $(basename "$0") <project-dir> [main.tex]" >&2
  echo "Example: $(basename "$0") real-analysis" >&2
  exit 1
fi

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROJECT="$1"
PROJECT_DIR="${ROOT}/${PROJECT}"

if [[ ! -d "$PROJECT_DIR" ]]; then
  echo "Project directory '$PROJECT' not found under $ROOT" >&2
  exit 1
fi

SRC_DIR="${PROJECT_DIR}/src"
BUILD_DIR="${PROJECT_DIR}/build"

if [[ ! -d "$SRC_DIR" ]]; then
  echo "Missing src/ directory in $PROJECT_DIR" >&2
  exit 1
fi

mkdir -p "$BUILD_DIR"

if [[ $# -ge 2 ]]; then
  MAIN_TEX="$SRC_DIR/$2"
else
  shopt -s nullglob
  TEX_FILES=("$SRC_DIR"/*.tex)
  shopt -u nullglob
  if [[ ${#TEX_FILES[@]} -ne 1 ]]; then
    echo "Please specify which .tex file to build (found ${#TEX_FILES[@]} candidates)." >&2
    exit 1
  fi
  MAIN_TEX="${TEX_FILES[0]}"
fi

if [[ ! -f "$MAIN_TEX" ]]; then
  echo "Tex file '$MAIN_TEX' does not exist." >&2
  exit 1
fi

MAIN_STEM="$(basename "$MAIN_TEX")"
MAIN_STEM="${MAIN_STEM%.tex}"
OUTPUT_PDF="${BUILD_DIR}/${MAIN_STEM}.pdf"
if [[ -f "$OUTPUT_PDF" ]]; then
  echo "Backing up existing $(basename "$OUTPUT_PDF") to $(basename "$OUTPUT_PDF").bak"
  cp "$OUTPUT_PDF" "${OUTPUT_PDF}.bak"
fi

echo "Building $(basename "$MAIN_TEX") for project '$PROJECT'..."
latexmk -pdf -silent -output-directory="$BUILD_DIR" "$MAIN_TEX"
echo "Done. Output in $BUILD_DIR"
