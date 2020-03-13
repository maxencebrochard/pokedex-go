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
			agent {docker { image "pokedex:${env.BUILD_ID}"  args '-u root:root'}}
            steps {
				sh 'npm install -g mocha'
				sh 'npm test'
            }
		}
		stage ('Building') {
			steps {
				sh '''
				docker run --name pokedex -d -u root -p 8080:8080 -v $(which docker):/usr/bin/docker -v /var/run/docker.sock:/var/run/docker.sock jenkins/jenkins:alpine
				'''
			}
		}
    }
}