#!/usr/bin/env bash
set -euo pipefail

echo repo-explicit:
comm -3 <(pacman -Qen | cut -d' ' -f1 | sort) <(cat packages/repo-explicit.txt)
echo
echo foreign-explicit:
comm -3 <(pacman -Qem | cut -d' ' -f1 | sort) <(cat packages/foreign-explcit.txt)
echo
echo optional:
comm -3 <(pacman -Qdtt | cut -d' ' -f1 | sort) <(cat packages/optional.txt)
