#! /bin/bash
version=1.13
TARGET_TAGS=('10.20-alpine' '10-alpine' '11-alpine' '11.15-alpine' '12-alpine' '12.10-alpine' '13-alpine' '13.4-alpine' '13.6-alpine' '14.2-alpine' '14-alpine' '15-alpine' '15.1-alpine' '15.2-alpine' '15.2-alpine' '15.3-alpine' '15.4-alpine' '15.5-alpine' '15.6-alpine')

for target_tag in "${TARGET_TAGS[@]}"
do
  docker build -t snieuw/pgdockerdump:$version-"$target_tag" --build-arg PG_TAG="$target_tag" .
  docker push snieuw/pgdockerdump:$version-"$target_tag"
done
