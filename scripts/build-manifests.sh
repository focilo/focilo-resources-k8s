#!/bin/bash

# detect pathname of this script:
templates_path=$(echo "from __future__ import print_function; \
import pkg_resources; \
print(pkg_resources.resource_filename('reana_resources_k8s', \
  'templates'))" | python)

# grab the name of the resources which need to be built
resources=$(for child in $templates_path/*; do file_name=$(basename "$child"); if [ "$file_name" != "config.yaml" ]; then echo "$file_name"; fi ; done)

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
    cd "$(dirname "$1")"
}

build_manifests () {
    mkdir -p "$templates_path"/../configuration_manifests/"$1"
    for template_file_path in $templates_path/"$1"/*template.yaml;
    do
        template_file_name=${template_file_path//"$templates_path/"/}
        config_file_name=${template_file_name//-template/}
        config_file_path="$templates_path/../configuration_manifests/$config_file_name"
        jinja2 "$template_file_path" "$templates_path/config.yaml" > "$config_file_path"
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
