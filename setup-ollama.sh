#!/usr/bin/env bash

set -euo pipefail

MODEL="${OLLAMA_MODEL:-qwen2.5:3b}"

if ! command -v docker >/dev/null 2>&1; then
  echo "Docker Desktop is required but was not found on PATH." >&2
  exit 1
fi

echo "Starting Ollama and GridWise containers..."
docker compose up -d --build ollama app

echo "Waiting for Ollama..."
for attempt in {1..30}; do
  if curl.exe -fsS http://127.0.0.1:11434/api/tags >/dev/null 2>&1; then
    break
  fi
  if [[ "$attempt" == "30" ]]; then
    echo "Ollama did not become ready in time." >&2
    exit 1
  fi
  sleep 2
done

echo "Pulling model: $MODEL"
docker exec gridwise-ollama ollama pull "$MODEL"

echo
 echo "Ready: http://127.0.0.1:6969"
echo "Test: curl.exe http://127.0.0.1:6969/health"
