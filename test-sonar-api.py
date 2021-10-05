from sonarqube import SonarQubeClient

url = 'http://localhost'
username = "<user>"
password = "<password>"
sonar = SonarQubeClient(sonarqube_url=url, username=username, password=password)

key = "<project-name>"

issues = list(sonar.issues.search_issues(componentKeys=key))

print(issues[0])
