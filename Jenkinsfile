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
                sh 'scp deploy.sh ec2-user@54.166.213.126:~/'
                sh 'ssh ec2-user@54.166.213.126 "chmod +x deploy.sh"'
                sh 'ssh ec2-user@54.166.213.126 ./deploy.ssh'
               
                }
        }
    
    
    stage('Manage Develop Branch') {
            steps {
                sh 'ssh ec2-user@54.166.213.126 mkdir /tmp/jagaban'
             }
            }
    }
}
