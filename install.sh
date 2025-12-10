#!/bin/bash

#
# This script just modifies ~/.bashrc to source ./.bashrc.
# Any modification in this repository is reflected on sourcing ./.bashrc.
#

set -ue

script_dir=$(cd $(dirname $BASH_SOURCE); pwd)

ln_platform_wise() {
# ln_platform_wise LINK_TARGET BIN1 [BIN2 ...]
  if [ "$#" -lt 2 ]; then
    echo "error: usage: ln_platform_wise LINK_TARGET BIN1 [BIN2 ...]" >&2
    exit -2
  fi

  LINK_TARGET="$1"; shift

  # Get Canonicalised Host Architecture
  host_arch="$(uname -m || true)"
  case "$host_arch" in
    x86_64|amd64) host_abi="x86_64" ;;
    aarch64|arm64) host_abi="aarch64" ;;
    *)
      echo "error: unsupported host arch: $host_arch" >&2
      exit -3
      ;;
  esac

  detect_abi() {
    bin="$1"
    # First, do a simple check for existence and executability
    if [ ! -e "$bin" ]; then
      echo "missing"
      return 0
    fi
    if [ ! -x "$bin" ]; then
      # Continue even if not executable because ABI can still be detected
      :
    fi

    if command -v readelf >/dev/null 2>&1; then
	  # Check `Machine` and `Class`
      h="$(readelf -h "$bin" 2>/dev/null || true)"
      case "$h" in
        *"Class:                             ELF64"*"*Machine:                           Advanced Micro Devices X86-64"*)
          echo "x86_64"; return 0 ;;
        *"Class:                             ELF64"*"*Machine:                           AArch64"*)
          echo "aarch64"; return 0 ;;
      esac
    fi

    if command -v file >/dev/null 2>&1; then
      f="$(file -b "$bin" 2>/dev/null || true)"
      case "$f" in
        *"ELF 64-bit"*x86-64*)
          echo "x86_64"; return 0 ;;
        *"ELF 64-bit"*aarch64*)
          echo "aarch64"; return 0 ;;
      esac
    fi

    echo "unknown"
  }

  # Detect ABI for all candidates
  candidates=""
  fallback=""
  for bin in "$@"; do
    abi="$(detect_abi "$bin")"
    if [ "$abi" = "missing" ]; then
      echo "warn: missing: $bin" >&2
      continue
    fi
    if [ "$abi" = "unknown" ]; then
      echo "warn: unknown ABI: $bin" >&2
      fallback="${fallback}${fallback:+ }$bin"
      continue
    fi
    # If executable check fails, still consider it
    if [ -x "$bin" ]; then
      :
    else
      echo "warn: not executable: $bin (ABI=$abi)" >&2
      # Still include as candidate (linking later is possible even if not executable)
    fi

    if [ "$abi" = "$host_abi" ]; then
      candidates="${candidates}${candidates:+ }$bin"
    else
      fallback="${fallback}${fallback:+ }$bin"
    fi
  done

  # Selection logic: prioritize host ABI match, fallback to first fallback
  selected=""
  if [ -n "$candidates" ]; then
    selected="${candidates%% *}"
  elif [ -n "$fallback" ]; then
    selected="${fallback%% *}"
  else
    echo "error: no viable binary among inputs" >&2
    return 4
  fi

  # Create symbolic link (replace if exists)
  # Ensure the directory of LINK_TARGET exists
  link_dir="$(dirname -- "$LINK_TARGET")"
  if [ ! -d "$link_dir" ]; then
    echo "error: link directory does not exist: $link_dir" >&2
    return 5
  fi

  if [ -L "$LINK_TARGET" ] || [ -e "$LINK_TARGET" ]; then
    rm -f -- "$LINK_TARGET"
  fi
  ln -is -- "$selected" "$LINK_TARGET"

  # Display information
  if command -v file >/dev/null 2>&1; then
    echo "info: $LINK_TARGET -> $selected ($(file -b "$selected"))" >&2
  else
    echo "info: $LINK_TARGET -> $selected" >&2
  fi

  return 0
}

# Copy Home directory files
find home_dir/ -maxdepth 1 | grep -Ev '^home_dir/$' | xargs -n16 -IXXX cp -a XXX $HOME/

# Link according to platform
ln_platform_wise $HOME/.local/bin/nvim \
  $HOME/.local/bin/nvim-linux-*.appimage


# for bash
user_bashrc=${HOME}/.bashrc
install_cmd="source $script_dir/.bashrc"
if [[ ! -f $user_bashrc ]] || [[ -z "cat $user_bashrc | grep $install_cmd" ]]; then
	echo $install_cmd >>$user_bashrc
fi

# for fish
user_fish_config=${HOME}/.config/fish/config.fish
install_cmd="source $script_dir/config.fish"
if [[ ! -f $user_fish_config ]] || [[ -z "cat $user_fish_config | grep $install_cmd" ]]; then
	mkdir -p $(dirname $user_fish_config)
	echo $install_cmd >>$user_fish_config
fi
