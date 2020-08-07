#!/usr/bin/env sh

RELEASE=1.8
JAR_NAME="google-java-format-${RELEASE}-all-deps.jar"
RELEASES_URL=https://github.com/google/google-java-format/releases/download
JAR_URL="${RELEASES_URL}/google-java-format-${RELEASE}/${JAR_NAME}"

CACHE_DIR="$HOME/.cache/google-java-format-git-pre-commit-hook"
JAR_FILE="$CACHE_DIR/$JAR_NAME"

echo "=================================="
echo "Running pre-commit code formatter"
echo "=================================="
if [[ ! -f "$JAR_FILE" ]]
then
    echo "Setting up google-java-format"
    mkdir -p "$CACHE_DIR"
    curl -L "$JAR_URL" -o "$JAR_FILE"

fi
changed_java_files=$(git diff --cached --name-only --diff-filter=ACMR | grep ".*java$" || true)
if [[ -n "$changed_java_files" ]]
then
    echo "The following files will checked and reformatted:"
    echo "$changed_java_files"
    if ! java -jar "$JAR_FILE" --replace --set-exit-if-changed $changed_java_files
    then
        echo "\nBad dod no biscuit. Some files were reformatted!"
    else
        echo "All good!"
    fi
    git add $changed_java_files
else
    echo "All good!"
fi
echo "=================================="
