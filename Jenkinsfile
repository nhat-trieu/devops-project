pipeline {
    agent any

    environment {
        SONARQUBE = 'SonarQubeServer'
        PATH = "/opt/sonar-scanner/bin:$PATH"
    }

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'git@github.com:nhat-trieu/devops-project.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv("${SONARQUBE}") {
                    sh 'sonar-scanner'
                }
            }
        }

stage('Build .NET Project') {
    steps {
        dir('Project_BanSach-20250515T063933Z-1-001') {
            sh 'dotnet build Project_BanSach.sln'
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
                docker run -d -p 8081:80 --name myapp myapp
                '''
            }
        }
    }
}

