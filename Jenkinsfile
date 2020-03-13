pipeline {
    agent any
    
    stages {
		node {
			git url: 'https://github.com/joe_user/simple-maven-project-with-tests.git'
			...
			}
    }
    post {
        always {
            archiveArtifacts artifacts: 'generatedFile.txt', onlyIfSuccessful: true
        }
    }
}