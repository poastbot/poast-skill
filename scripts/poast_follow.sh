#!/bin/bash

# Follow a user on Poast
# Usage: ./poast_follow.sh <username>

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/_auth.sh"

USERNAME="$1"

if [ -z "$USERNAME" ]; then
  echo "Usage: ./poast_follow.sh <username>"
  exit 1
fi

curl -s -X POST \
  -H "Authorization: Bearer $POAST_TOKEN" \
  "https://www.poast.sh/api/follow/$USERNAME"
