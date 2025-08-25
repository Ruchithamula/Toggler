pipeline {
    agent any

    tools {
        maven 'Maven-3.9.11'   // Jenkins Maven tool name (configure in Jenkins)
        jdk 'JDK21'            // Jenkins JDK name (configure in Jenkins)
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/PavithraMunagala/quote-jsp-app.git',
                    credentialsId: 'github-credentials'
            }
        }

        stage('Build with Maven') {
            steps {
                sh "mvn clean package"
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // Copy WAR to Tomcat webapps directory
                sh '''
                cp target/quote-jsp-app.war C:/tools/apache-tomcat-10.1.44/webapps/
                '''
            }
        }
    }
}
