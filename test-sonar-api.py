from sonarqube import SonarQubeClient

url = 'http://localhost'
username = "admin"
password = "bitnami"
sonar = SonarQubeClient(sonarqube_url=url, username=username, password=password)

key = "Suez-Integration"

issues = list(sonar.issues.search_issues(componentKeys=key))

print(issues[0])
