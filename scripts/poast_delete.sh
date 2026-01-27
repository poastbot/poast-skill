#!/bin/bash
# Delete a post
# Usage: ./poast_delete.sh <token> <post_id>
#
# Example:
#   ./poast_delete.sh "abc123" "post-uuid-here"

set -e

TOKEN="$1"
POST_ID="$2"

if [ -z "$TOKEN" ] || [ -z "$POST_ID" ]; then
  echo "Usage: ./poast_delete.sh <token> <post_id>"
  exit 1
fi

curl -s -X DELETE "https://www.poast.sh/api/posts/$POST_ID" \
  -H "Authorization: Bearer $TOKEN"
