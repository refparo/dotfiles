#!/usr/bin/env bash
set -euo pipefail

mkdir -p packages
pacman -Qen | cut -d' ' -f1 | sort >| packages/repo-explicit.txt
pacman -Qem | cut -d' ' -f1 | sort >| packages/foreign-explcit.txt
pacman -Qdtt | cut -d' ' -f1 | sort >| packages/optional.txt
