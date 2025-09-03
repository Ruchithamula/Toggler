pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Ruchithamula/Toggler.git', branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                // Add build commands here (e.g., npm install, mvn package, gradle build, etc.)
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests...'
                // Add test commands here if you have them
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deployment step executed.'
            }
        }
    }
}
