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
				}
			}
            steps {
				sh 'cd /app && npm test'
            }
		}
		stage ('Deploy') {
			steps {
				sh '''
				docker run pokedex -d -p 5555
				'''
			}
		}
    }
}