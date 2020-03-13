pipeline {
    agent any
    stages {
		stage('Checkout') {
			steps {
			checkout scm
			}
		}
		stage('Build') {
			steps {
				script{
					def customImage = docker.build("pokedex:${env.BUILD_ID}")
				}
			}
		}
        stage('Test') {
			agent {
				docker { 
					image "pokedex:${env.BUILD_ID}"  
					args "-u root:root"
				}
			}
            steps {
				sh 'npm test'
            }
		}
		stage ('Deploy') {
			steps {
				sh '''
				docker run pokedex -d -u root -p 5555 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:alpine
				'''
			}
		}
    }
}