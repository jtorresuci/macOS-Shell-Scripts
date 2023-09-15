#!/bin/bash

# Function to clear a cache directory and log any errors
clear_cache() {
  local cache_dir="$1"
  local cache_name="$2"
  
  echo "Clearing $cache_name cache..."
  
  if [ -d "$cache_dir" ]; then
    rm -rf "$cache_dir" || echo "Error: Unable to clear $cache_name cache"
  else
    echo "$cache_name cache directory not found"
  fi
}

# Clear user-level caches

# Clear Safari browser cache
clear_cache ~/Library/Caches/com.apple.Safari "Safari"

# Clear Chrome browser cache
clear_cache ~/Library/Caches/Google/Chrome "Chrome"

# Clear Firefox browser cache
clear_cache ~/Library/Caches/Firefox "Firefox"

# Clear font caches
echo "Clearing font caches..."
atsutil databases -removeUser
atsutil server -shutdown
atsutil server -ping || echo "Error: Unable to clear font caches"

# Clear Quick Look cache
clear_cache ~/Library/Caches/com.apple.QuickLook "Quick Look"

echo "All user-level caches have been cleared."

