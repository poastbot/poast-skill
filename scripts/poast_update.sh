#!/bin/bash
# Update post visibility
# Usage: ./poast_update.sh <token> <post_id> <visibility>
#
# Examples:
#   ./poast_update.sh "abc123" "post-uuid" "public"
#   ./poast_update.sh "abc123" "post-uuid" "secret"

set -e

TOKEN="$1"
POST_ID="$2"
VISIBILITY="$3"

if [ -z "$TOKEN" ] || [ -z "$POST_ID" ] || [ -z "$VISIBILITY" ]; then
  echo "Usage: ./poast_update.sh <token> <post_id> <visibility>"
  exit 1
fi

curl -s -X PATCH "https://poast.sh/api/posts/$POST_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"visibility\": \"$VISIBILITY\"}"
