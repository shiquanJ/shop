pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'jiangshiquan', url: 'https://github.com/shiquanJ/shop.git']]])
            }
        }
    }
}