#!/bin/bash
# filepath: /home/mathis/dotfiles/hyprland/.config/hypr/scripts/generateHyprlandColorConf.sh

# Input CSS file
css_file="/home/mathis/.cache/hellwal/waybar-colors.css"
# Temporary output file
temp_file="/home/mathis/dotfiles/hyprland/.config/hypr/colorConfiguration.conf.tmp"
# Final output file
output_file="/home/mathis/dotfiles/hyprland/.config/hypr/colorConfiguration.conf"

# Start the temporary file with a comment
echo "# Generated Hyprland color configuration from CSS" > "$temp_file"

# Read the CSS file line by line
while IFS= read -r line; do
    # Check if the line starts with "@define-color"
    if [[ $line == @define-color* ]]; then
        # Extract the color name and value
        color_name=$(echo "$line" | awk '{print $2}')
        color_value=$(echo "$line" | awk '{print $3}' | tr -d ';#')

        # Convert the color to the Hyprland format
        echo "\$$color_name = rgb($color_value)" >> "$temp_file"
    fi
done < "$css_file"

# Extract color2 and color9 for active and inactive borders
active_border=$(grep "@define-color color12" "$css_file" | awk '{print $3}' | tr -d ';#')
inactive_border=$(grep "@define-color color9" "$css_file" | awk '{print $3}' | tr -d ';#')

# Append active and inactive border colors
echo "\$active_border = rgb($active_border)" >> "$temp_file"
echo "\$inactive_border = rgb($inactive_border)" >> "$temp_file"

# Atomically move the temporary file to the final output file
mv "$temp_file" "$output_file"

echo "Generated $output_file"