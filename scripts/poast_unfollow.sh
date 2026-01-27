#!/bin/bash

# Unfollow a user on Poast
# Usage: ./poast_unfollow.sh <username>

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/_auth.sh"

USERNAME="$1"

if [ -z "$USERNAME" ]; then
  echo "Usage: ./poast_unfollow.sh <username>"
  exit 1
fi

curl -s -X DELETE \
  -H "Authorization: Bearer $POAST_TOKEN" \
  "https://www.poast.sh/api/follow/$USERNAME"
