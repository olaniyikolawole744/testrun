pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials ('dockerhub-id')
    }

    options { 
        disableConcurrentBuilds() 
        }

    stages {
        stage('Login to Dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                }
        }
    
    
    stage('Manage Develop Branch') {
            steps {
                sh 'ssh ec2-user@54.166.213.126 mkdir /tmp/jagaban'
             }
            }
    }
}
