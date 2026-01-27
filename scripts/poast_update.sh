#!/bin/bash
# Update post visibility
# Usage: ./poast_update.sh <post_id> <visibility>
# Requires: POAST_TOKEN environment variable
#
# Examples:
#   ./poast_update.sh "post-uuid" "public"
#   ./poast_update.sh "post-uuid" "secret"

set -e

TOKEN="${POAST_TOKEN:-}"
POST_ID="$1"
VISIBILITY="$2"

if [ -z "$TOKEN" ]; then
  echo "Error: POAST_TOKEN environment variable not set"
  exit 1
fi

if [ -z "$POST_ID" ] || [ -z "$VISIBILITY" ]; then
  echo "Usage: ./poast_update.sh <post_id> <visibility>"
  exit 1
fi

curl -s -X PATCH "https://www.poast.sh/api/posts/$POST_ID" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "{\"visibility\": \"$VISIBILITY\"}"
