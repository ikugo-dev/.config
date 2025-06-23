find . -mindepth 2 -type f | while IFS= read -r file; do
    parent_dir=$(basename "$(dirname "$file")")
    base_name=$(basename "$file")
    new_name="./${parent_dir}_${base_name}"

    if [[ -e "$new_name" ]]; then
        echo "Warning: $new_name already exists, skipping."
        continue
    fi

    mv "$file" "$new_name"
done
