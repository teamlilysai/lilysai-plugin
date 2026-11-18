#!/usr/bin/env bash
# ChatGPT(OpenAI) 플러그인 제출용 ZIP 을 만든다.
#   openai/plugin.json · openai/mcp.json · openai/assets/  +  공용 skills/  →  dist/readray-openai-<version>.zip
# 스킬은 Claude·Codex 패키지와 같은 skills/ 를 그대로 쓴다(사본을 두지 않는다).
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(python3 -c 'import json,sys;print(json.load(open(sys.argv[1]))["version"])' "$root/openai/plugin.json")"
stage="$(mktemp -d)"
trap 'rm -rf "$stage"' EXIT
cp "$root/openai/plugin.json" "$root/openai/mcp.json" "$stage/"
cp -R "$root/openai/assets" "$stage/assets"
cp -R "$root/skills" "$stage/skills"
mkdir -p "$root/dist"
out="$root/dist/readray-openai-$version.zip"
rm -f "$out"
(cd "$stage" && zip -qr -X "$out" plugin.json mcp.json assets skills)
echo "$out"
