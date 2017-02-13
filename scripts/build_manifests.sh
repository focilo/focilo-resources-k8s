#!/bin/bash

# detect pathname of this script:
scriptpathname=$(cd "$(dirname "$0")" && pwd)

# grab the name of the resources which need to be built
resources=$(for child in $scriptpathname/../templates/*; do file_name=$(basename "$child"); if [ "$file_name" != "config.yaml" ]; then echo "$file_name"; fi ; done)

build_manifests () {
    mkdir -p "$scriptpathname"/../configuration_manifests/"$1"
    for template_file_path in $scriptpathname/../templates/"$1"/*template.yaml;
    do
        template_file_name=${template_file_path//"$scriptpathname/../templates/"/}
        config_file_name=${template_file_name//-template/}
        config_file_path="$scriptpathname/../configuration_manifests/$config_file_name"
        jinja2 "$template_file_path" "$scriptpathname/../templates/config.yaml" > "$config_file_path"
        sed '/^[[:space:]]*$/d' -i "$config_file_path"
        echo "'Created -> '$config_file_path"
    done;
}

for resource in $resources;
do
    build_manifests "$resource";
done;
