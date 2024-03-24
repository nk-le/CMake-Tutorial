#!/bin/bash

set -e

declare -a git_resources=(
    "https://github.com/PaulStoffregen/cores.git"
    "https://github.com/PaulStoffregen/Audio.git"
    "https://github.com/PaulStoffregen/Wire.git"
    "https://github.com/PaulStoffregen/SPI.git"
    "https://github.com/PaulStoffregen/SerialFlash.git"
    "https://github.com/PaulStoffregen/arm_math.git"
    "https://github.com/greiman/SdFat.git"
    "https://github.com/PaulStoffregen/SD.git -b Juse_Use_SdFat "
)

# if [ ! -d "$HOME"/git ]; then
#     mkdir "$HOME"/git
# fi
# #cd "$HOME"/git

for url in "${git_resources[@]}"; do
    dir="${url##*/}"
    dir="${dir%.git}"
    if [ -e "$dir/.git" ]; then
        #git -C "$dir" update

        echo -e "Existed folder $dir. Ignore..."
    else
        git clone "$url"
    fi
done

