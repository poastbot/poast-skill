#!/bin/bash
# Delete a post
# Usage: ./poast_delete.sh <post_id>
# Requires: POAST_TOKEN environment variable
#
# Example:
#   ./poast_delete.sh "post-uuid-here"

set -e

TOKEN="${POAST_TOKEN:-}"
POST_ID="$1"

if [ -z "$TOKEN" ]; then
  echo "Error: POAST_TOKEN environment variable not set"
  exit 1
fi

if [ -z "$POST_ID" ]; then
  echo "Usage: ./poast_delete.sh <post_id>"
  exit 1
fi

curl -s -X DELETE "https://www.poast.sh/api/posts/$POST_ID" \
  -H "Authorization: Bearer $TOKEN"
