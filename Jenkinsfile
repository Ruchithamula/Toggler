pipeline {
    agent any

    tools {
        maven 'Maven3'  
        jdk 'JDK11'      
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                bat 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment step (customize later)'
            }
        }
    }
}
