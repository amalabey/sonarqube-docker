# Overview  
Local setup of SonarQube using docker-compose for easy code scanning.

## Prerequisites
- Latest version of docker installed (tested on WSL2)
- Install latest JRE before running sonar scanner or exporting reports


## Running SonarQube
```
./start-sonarqube.sh
```  

## Running Sonar Scanner
Install sonarscanner tool for dotnet cli before running the scanner.
```
dotnet tool install --global dotnet-sonarscanner
```  

Run the scanner to publish report to SonarQube:
```
./run-sonarscanner.sh -w <dotnet sln dir> -t <token> -p <project name>
```  

## Exporting Reports
```
./export-report -t <token> -p <project name>
```

## API Acess via Python
```
sudo pip install --upgrade python-sonarqube-api
python test-sonar-api.py
```

