#!/bin/bash

gem1=$(gem list --local | cut -d " " -f 1 | tr "\n" " ")
gem2=$(cat Gemfile | grep -E "gem [a-z.]*" | cut -d " " -f 2 | tr "'" " " )

printf "Desinstalando tudo do Gemfile...\n\n"

for g1 in $gem1; do
        for g2 in $gem2; do
                if [ $g1 = $g2 ]; then
                        sudo gem uninstall $g1
                fi
        done
done
