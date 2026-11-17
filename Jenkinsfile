
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

        stage('Deploy') {
            steps {
                sh 'cd /d/DevOpsProjects/django-notes-app && docker-compose pull django_app && docker-compose up -d --no-build'
            }
        }
    }
}

