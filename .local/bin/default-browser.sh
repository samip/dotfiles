#!/bin/sh

is_wsl() {
    grep -qEi "(Microsoft|WSL)" /proc/sys/kernel/osrelease
}

url=$1
if echo "$url" | grep "localhost" >/dev/null; then
  browser="chrome"
  if is_wsl; then
    powershell.exe Start -Filepath "$browser".exe "$url"
  else
    $browser $url
  fi
else
  browser="vivaldi"
  if is_wsl; then
    powershell.exe Start "$url"
  else
    $browser_url
  fi
fi
