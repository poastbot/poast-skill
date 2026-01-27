#!/bin/bash
# Get a single post by ID
# Usage: ./poast_get.sh <post_id>
#
# Example:
#   ./poast_get.sh abc123-def456

set -e

POST_ID="$1"

if [ -z "$POST_ID" ]; then
  echo "Usage: ./poast_get.sh <post_id>"
  exit 1
fi

curl -s "https://www.poast.bot/api/posts/$POST_ID"
