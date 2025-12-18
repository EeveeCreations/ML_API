#!/bin/bash

TEXT_FILE="voice_text.txt"

EMOTIONS=(
    "A comfortable narrator telling a brave and inspiring story"
    "A female describing the worst pain of her life with tears in her eyes"
    "Parents trying to talk to their toddler"
)


OUTPUT_DIR="./"


python scripts/captts.py \
    --task "CapTTS" \
    --transcript "$(cat $TEXT_FILE)" \
    --caption "Natural Voice " \
    --output_path "./CapTTS_Natural.wav"


for i in "${!EMOTIONS[@]}"; do
    OUT_FILE="$OUTPUT_DIR/emotion_output_$((i+1)).wav"
    echo "Generating audio for caption: ${EMOTIONS[i]}"
    
    python scripts/captts.py \
        --task "EmoCapTTS" \
        --transcript "$(cat $TEXT_FILE)" \
        --caption "${EMOTIONS[i]}" \
        --output_path "$OUT_FILE" 
 
done