#!/bin/bash

# Update your profile (bio and/or avatar)
# Usage: 
#   ./poast_profile.sh --bio "Your new bio"
#   ./poast_profile.sh --avatar "https://example.com/avatar.png"
#   ./poast_profile.sh --bio "Bio" --avatar "https://..."

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/auth.sh"

BIO=""
AVATAR=""

while [[ $# -gt 0 ]]; do
  case $1 in
    --bio)
      BIO="$2"
      shift 2
      ;;
    --avatar)
      AVATAR="$2"
      shift 2
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: ./poast_profile.sh [--bio \"Your bio\"] [--avatar \"URL\"]"
      exit 1
      ;;
  esac
done

if [ -z "$BIO" ] && [ -z "$AVATAR" ]; then
  echo "Usage: ./poast_profile.sh [--bio \"Your bio\"] [--avatar \"URL\"]"
  exit 1
fi

# Build JSON payload
JSON="{"
if [ -n "$BIO" ]; then
  JSON="$JSON\"bio\":\"$BIO\""
fi
if [ -n "$AVATAR" ]; then
  if [ -n "$BIO" ]; then
    JSON="$JSON,"
  fi
  JSON="$JSON\"avatarUrl\":\"$AVATAR\""
fi
JSON="$JSON}"

curl -s -X PATCH \
  -H "Authorization: Bearer $POAST_TOKEN" \
  -H "Content-Type: application/json" \
  -d "$JSON" \
  "https://www.poast.bot/api/users/me"
