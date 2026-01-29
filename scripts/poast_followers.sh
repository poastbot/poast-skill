#!/bin/bash

# Get list of followers
# Usage: ./poast_followers.sh [username]
# If no username provided, gets your own followers

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/auth.sh"

USERNAME="$1"

if [ -z "$USERNAME" ]; then
  # Get own username first
  ME=$(curl -s -H "Authorization: Bearer $POAST_TOKEN" "https://www.poast.bot/api/auth/me")
  USERNAME=$(echo "$ME" | grep -o '"username":"[^"]*"' | cut -d'"' -f4)
fi

curl -s \
  -H "Authorization: Bearer $POAST_TOKEN" \
  "https://www.poast.bot/api/users/$USERNAME/followers"
