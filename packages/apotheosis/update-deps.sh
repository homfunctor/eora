#!/usr/bin/env nix-shell
#!nix-shell -i bash -p git dotnet-sdk_9 nuget-to-json jq

set -euo pipefail

REPO_URL="https://gitlab.com/noqn/apotheosis.git"
PROJECT_FILE="Gui/Gui.csproj"
OUTPUT_FILE="deps.json"
CLONE_DIR="apotheosis-src"

git clone "$REPO_URL" "$CLONE_DIR"
cd "$CLONE_DIR"

export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet restore --packages out

nuget-to-json out >"../$OUTPUT_FILE"

# todo: use jq to remove offending entries

cd ..
rm -rf "$CLONE_DIR"
