#!/bin/bash

# detect pathname of this script:
scriptpathname=$(cd "$(dirname "$0")" && pwd)

# grab the name of the resources which need to be built
resources=$(for child in $scriptpathname/../templates/*; do file_name=$(basename "$child"); if [ "$file_name" != "config.yaml" ]; then echo "$file_name"; fi ; done)

split_file () {
    extension=${1##*.}
    cd "$(dirname "$1")"
    csplit -zq "$(basename "$1")" /"$2"/ "{*}"
    for old_file_name in xx*;
    do
        new_file_name="$(grep 'name' "$old_file_name" | head -1 | cut -d ':' -f 2 | tr -d ' ').$extension"
        mv "$old_file_name" "$new_file_name"
        echo "Created -> $(dirname "$1")/$new_file_name"
    done;
    rm "$config_file_path"
    cd "$scriptpathname"
}

build_manifests () {
    mkdir -p "$scriptpathname"/../configuration_manifests/"$1"
    for template_file_path in $scriptpathname/../templates/"$1"/*template.yaml;
    do
        template_file_name=${template_file_path//"$scriptpathname/../templates/"/}
        config_file_name=${template_file_name//-template/}
        config_file_path="$scriptpathname/../configuration_manifests/$config_file_name"
        jinja2 "$template_file_path" "$scriptpathname/../templates/config.yaml" > "$config_file_path"
        sed '/^[[:space:]]*$/d' -i "$config_file_path"
        if [ "$(grep -c '\-\-\-' "$config_file_path")" -gt 1 ];
        then
            split_file "$config_file_path" "---"
        else
            echo "Created -> $config_file_path"
        fi
    done;
}

for resource in $resources;
do
    build_manifests "$resource";
done;
