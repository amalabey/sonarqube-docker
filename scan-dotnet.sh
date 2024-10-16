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

cd $workingDir

cwd=$(pwd)
echo $cwd

dotnet tool install --global dotnet-sonarscanner
dotnet tool install --global dotnet-coverage
dotnet sonarscanner begin /k:$project /d:sonar.login=$token /d:sonar.host.url=http://localhost  /d:sonar.cs.vscoveragexml.reportsPaths=coverage.xml
dotnet build
dotnet-coverage collect 'dotnet test' -f xml  -o 'coverage.xml'
dotnet sonarscanner end /d:sonar.login=$token
