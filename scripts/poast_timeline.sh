#!/bin/bash

# Get your timeline (posts from users you follow)
# Usage: ./poast_timeline.sh [limit]

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/_auth.sh"

LIMIT="${1:-20}"

curl -s \
  -H "Authorization: Bearer $POAST_TOKEN" \
  "https://www.poast.bot/api/feed?limit=$LIMIT"
