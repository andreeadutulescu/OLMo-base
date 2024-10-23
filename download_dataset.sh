#!/bin/bash

# Check if the user provided the .txt file and the destination directory
#if [ "$#" -ne 2 ]; then
#    echo "Usage: $0 url_list.txt /path/to/download/location"
#    exit 1
#fi

# Assign arguments to variables
#url_list=$1
#destination=$2
url_list=OLMo-base/datasets_urls_training.txt
destination=datasets_urls_train

# Create destination directory if it doesn't exist
mkdir -p "$destination"

# Iterate through each line in the URL list file
while IFS= read -r url; do
    echo "Processing $url..."

    # Extract everything from "gpt" onwards and format the filename
    file_name=$(echo "$url" | sed 's|.*gpt||' | sed 's|/|_|g')

    # Download the file and save it with the new filename
    wget -O "$destination/$file_name" "$url"
done < "$url_list"

echo "All files downloaded to $destination"
