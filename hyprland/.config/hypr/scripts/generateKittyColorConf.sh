#!/bin/bash

# filepath: /home/mathis/.cache/hellwal/hyprland-colors.conf
# Input file
input_file="/home/mathis/.cache/hellwal/hyprland-colors.conf"

# Output file for Kitty
output_file="/home/mathis/.config/kitty/kitty-colors.conf"

# Start the Kitty configuration
echo "# Generated Kitty color configuration" > "$output_file"

# Loop through the input file and map colors to Kitty's format
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -z "$line" || "$line" == \#* ]]; then
        continue
    fi

    # Extract variable name and color value
    if [[ "$line" =~ ^\$(.*)\ =\ rgb\((.*)\)$ ]]; then
        var_name="${BASH_REMATCH[1]}"
        color_value="${BASH_REMATCH[2]}"

        # Map Hyprland colors to Kitty colors
        case "$var_name" in
            background) echo "background #$color_value" >> "$output_file" ;;
            foreground) echo "foreground #$color_value" >> "$output_file" ;;
            color0) echo "color0 #$color_value" >> "$output_file" ;;
            color1) echo "color1 #$color_value" >> "$output_file" ;;
            color2) echo "color2 #$color_value" >> "$output_file" ;;
            color3) echo "color3 #$color_value" >> "$output_file" ;;
            color4) echo "color4 #$color_value" >> "$output_file" ;;
            color5) echo "color5 #$color_value" >> "$output_file" ;;
            color6) echo "color6 #$color_value" >> "$output_file" ;;
            color7) echo "color7 #$color_value" >> "$output_file" ;;
            color8) echo "color8 #$color_value" >> "$output_file" ;;
            color9) echo "color9 #$color_value" >> "$output_file" ;;
            color10) echo "color10 #$color_value" >> "$output_file" ;;
            color11) echo "color11 #$color_value" >> "$output_file" ;;
            color12) echo "color12 #$color_value" >> "$output_file" ;;
            color13) echo "color13 #$color_value" >> "$output_file" ;;
            color14) echo "color14 #$color_value" >> "$output_file" ;;
            color15) echo "color15 #$color_value" >> "$output_file" ;;
        esac
    fi
done < "$input_file"

echo "Kitty color configuration generated at $output_file"