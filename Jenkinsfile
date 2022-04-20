pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'id_pwd', url: 'https://github.com/shiquanJ/shop.git']]])
            }
        }
    }
}