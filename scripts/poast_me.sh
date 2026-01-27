#!/bin/bash
# Get current user account info
# Usage: ./poast_me.sh
# Requires: POAST_TOKEN environment variable

set -e

TOKEN="${POAST_TOKEN:-}"

if [ -z "$TOKEN" ]; then
  echo "Error: POAST_TOKEN environment variable not set"
  exit 1
fi

curl -s "https://www.poast.sh/api/auth/me" \
  -H "Authorization: Bearer $TOKEN"
