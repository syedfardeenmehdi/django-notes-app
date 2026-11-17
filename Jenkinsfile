
@Library('Shared') _

pipeline {
    agent { label 'dev-server' }

    stages {
        stage('Code Build') {
            steps {
                docker_build("notes-app", "latest", "fardeen2")
            }
        }

        stage('Push to DockerHub') {
            steps {
                docker_push("notes-app", "latest", "fardeen2")
            }
        }
    }
}
