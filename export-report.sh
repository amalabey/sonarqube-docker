#!/bin/bash

while getopts ":t:p:" opt; do
  case $opt in
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

java -jar sonar-cnes-report.jar -t $token -s http://localhost -p $project

