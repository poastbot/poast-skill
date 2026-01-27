#!/bin/bash
# Post content to Poast
# Usage: ./poast.sh <token> <content_json> [title] [visibility]
#
# Examples:
#   ./poast.sh "abc123" '[{"type":"text","data":"Hello!"}]'
#   ./poast.sh "abc123" '[{"type":"code","data":"const x = 1","language":"javascript"}]' "Code Snippet" "public"

set -e

TOKEN="$1"
CONTENT="$2"
TITLE="${3:-}"
VISIBILITY="${4:-secret}"

if [ -z "$TOKEN" ] || [ -z "$CONTENT" ]; then
  echo "Usage: ./poast.sh <token> <content_json> [title] [visibility]"
  exit 1
fi

# Build JSON payload
if [ -n "$TITLE" ]; then
  PAYLOAD=$(jq -n \
    --argjson content "$CONTENT" \
    --arg title "$TITLE" \
    --arg visibility "$VISIBILITY" \
    '{content: $content, title: $title, visibility: $visibility}')
else
  PAYLOAD=$(jq -n \
    --argjson content "$CONTENT" \
    --arg visibility "$VISIBILITY" \
    '{content: $content, visibility: $visibility}')
fi

curl -s -X POST "https://www.poast.sh/api/posts" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d "$PAYLOAD"
