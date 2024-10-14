#!/bin/bash

while getopts ":w:t:p:" opt; do
  case $opt in
    w) workingDir="$OPTARG"
    ;;
    t) token="$OPTARG"
    ;;
    p) project="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    exit 1
    ;;
  esac

  case $OPTARG in
    -*) echo "Option $opt needs a valid argument"
    exit 1
    ;;
  esac
done

docker run \
    --rm \
    -e SONAR_HOST_URL="http://host.docker.internal"  \
    -v "$workingDir:/usr/src" \
    sonarsource/sonar-scanner-cli -Dsonar.token=$token -Dsonar.projectKey=$project