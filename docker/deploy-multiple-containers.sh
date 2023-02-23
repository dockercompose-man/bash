#!/bin/bash

compose_files=("/path/to/docker-compose-1.yml" "/path/to/docker-compose-2.yml" "/path/to/docker-compose-3.yml" "/path/to/docker-compose-4.yml" "/path/to/docker-compose-5.yml" "/path/to/docker-compose-6.yml" "/path/to/docker-compose-7.yml" "/path/to/docker-compose-8.yml" "/path/to/docker-compose-9.yml" "/path/to/docker-compose-10.yml")

for file in "${compose_files[@]}"
do
    echo "Deploying compose file $file"
    docker-compose -f "$file" up -d
done
