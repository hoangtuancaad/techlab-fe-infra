#!/bin/bash
rm -rf tf_state
tar -xzvf tf_state.tar.gz

for dir in ./tf_state/*; do
    echo "importing $dir";
    folder_name=$(basename "$dir")
    # copy content
    cp -rf "$dir/" "./environments/$folder_name"  #2>/dev/null
done
rm -rf tf_state