#!/usr/bin/env bash

cava -p ~/.config/cava/waybar | while IFS=';' read -ra bars; do
    output=""

    for value in "${bars[@]}"; do
        case "$value" in
            0) char="▁" ;;
            1) char="▂" ;;
            2) char="▃" ;;
            3) char="▄" ;;
            4) char="▅" ;;
            5) char="▆" ;;
            6) char="▇" ;;
            7) char="█" ;;
            *) char="▁" ;;
        esac

        output+="$char"
    done

    printf '%s\n' "$output"
done

