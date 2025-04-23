voici mon sscript : #!/bin/bash

#Adapting the palette based in ActualPath Image

#Creating the bin
make -C ~/dotfiles/hellwal/

conf="$HOME/.config/hypr/hyprpaper.conf"
# Étape 1 : récupérer le nom de la variable (ex : $path3)
actual_var=$(grep '^\$ActualPath' "$conf" | cut -d= -f2 | xargs)

# Étape 2 : extraire la vraie valeur de cette variable (ex : death.jpeg)
actual_value=$(grep "^$actual_var" "$conf" | cut -d= -f2 | xargs)

#echo "Nom de l'image : $actual_value"

./dotfiles/hellwal/hellwal  -i "~/dotfiles/hyprpaper/wallpapers/$actual_value"

hyprctl reload

