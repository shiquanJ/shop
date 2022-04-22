pipeline {
    agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11' 
            args '-v /root/.m2:/root/.m2' 
        }
    }
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