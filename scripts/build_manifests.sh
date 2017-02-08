#!/bin/bash

# detect pathname of this script:
scriptpathname=$(cd "$(dirname "$0")" && pwd)

function build_reana_system_nodes_manifests {
    mkdir -p "$scriptpathname"/../configuration_manifests/deployments/reana-system
    for template_file_path in $scriptpathname/../templates/reana-system/*template.yaml;
    do
        template_file_name=${template_file_path//"$scriptpathname/../templates/reana-system/"/}
        config_file_name=${template_file_name//-template/}
        config_file_path="$scriptpathname/../configuration_manifests/deployments/reana-system/$config_file_name"
        jinja2 "$template_file_path" "$scriptpathname/../templates/config.yaml" > "$config_file_path"
        sed '/^[[:space:]]*$/d' -i "$config_file_path"
        echo "'Created -> '$config_file_path"
    done;
}

build_reana_system_nodes_manifests
