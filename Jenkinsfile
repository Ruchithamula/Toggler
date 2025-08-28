pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "quote-jsp-app:latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/PavithraMunagala/quote-jsp-app.git'
            }
        }

        stage('Build with Maven') {
            steps {
                bat "C:\\tools\\apache-maven-3.9.11\\bin\\mvn clean package"
            }
        }

        stage('Build Docker Image') {
            steps {
                bat "docker build -t %DOCKER_IMAGE% ."
            }
        }

        stage('Run Docker Container') {
            steps {
                // Stop and remove existing container if any
                bat "docker rm -f quote-jsp-app || echo 'No existing container'"
                // Run container on port 8082
                bat "docker run -d -p 8082:8080 --name quote-jsp-app %DOCKER_IMAGE%"
            }
        }
    }

    post {
        success {
            echo 'CI/CD pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check the console output.'
        }
    }
}
