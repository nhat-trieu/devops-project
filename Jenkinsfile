pipeline {
    agent any

    environment {
        SONARQUBE = 'SonarQubeServer'
    }

    stages {
        stage('Clone') {
            steps {
                 git branch: 'main', url: 'https://github.com/nhat-trieu/devops-project.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE}") {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Build Docker') {
            steps {
                sh 'docker build -t myapp .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop myapp || true
                docker rm myapp || true
                docker run -d -p 8080:80 --name myapp myapp
                '''
            }
        }
    }
}
