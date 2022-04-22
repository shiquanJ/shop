pipeline {
    agent none
    stages {
        stage('checkout') { 
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'shiquanJ', url: 'https://github.com/shiquanJ/shop.git']]])
            }
        }
        stage('Build') { 
            steps {
                sh 'mvn clean package -D maven.test.skip=true' 
            }
        }
        stage('docker-image') { 
            steps {
                sh 'docker build -t jsqjiang/sgshop:v1 .'
            }
        }
        stage('docker-container') { 
            steps {
                sh 'docker run -d -p 80:80 jsqjiang/shop:v1'
            }
        }
    }
}
