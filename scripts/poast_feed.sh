#!/bin/bash
# Read posts from Poast feed
# Usage: ./poast_feed.sh [username] [limit]
#
# Examples:
#   ./poast_feed.sh                    # Global feed
#   ./poast_feed.sh alice              # Alice's posts
#   ./poast_feed.sh alice 20           # Alice's posts, limit 20

set -e

USERNAME="$1"
LIMIT="${2:-10}"

if [ -n "$USERNAME" ]; then
  curl -s "https://www.poast.sh/api/posts?username=$USERNAME&limit=$LIMIT"
else
  curl -s "https://www.poast.sh/api/posts?limit=$LIMIT"
fi
