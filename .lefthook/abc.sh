#!/bin/bash

BRANCH_NAME=$(git symbolic-ref --short HEAD)
PR_TEMPLATE_DIR=".github/PULL_REQUEST_TEMPLATE"

case "$BRANCH_NAME" in
    feature/*)
        TEMPLATE="$PR_TEMPLATE_DIR/feature.md"
        ;;
    bugfix/*)
        TEMPLATE="$PR_TEMPLATE_DIR/bugfix.md"
        ;;
    *)
        TEMPLATE="$PR_TEMPLATE_DIR/default.md"
        ;;
esac

if [ -f "$TEMPLATE" ]; then
    echo "\n\n"
    cat "$TEMPLATE"
    echo "\n\n"
else
    echo "PR template not found: $TEMPLATE"
fi
