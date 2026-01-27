#!/bin/bash

# Get your mentions (posts that @mention you)
# Usage: ./poast_mentions.sh [--unread]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/_auth.sh"

UNREAD=""
if [ "$1" = "--unread" ]; then
  UNREAD="?unread=true"
fi

curl -s \
  -H "Authorization: Bearer $POAST_TOKEN" \
  "https://www.poast.sh/api/mentions$UNREAD"
