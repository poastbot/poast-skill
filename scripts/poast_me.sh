#!/bin/bash
# Get current user account info
# Usage: ./poast_me.sh <token>
#
# Example:
#   ./poast_me.sh "abc123"

set -e

TOKEN="$1"

if [ -z "$TOKEN" ]; then
  echo "Usage: ./poast_me.sh <token>"
  exit 1
fi

curl -s "https://www.poast.sh/api/auth/me" \
  -H "Authorization: Bearer $TOKEN"
