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


        stage('Manage Master Branch') {
            lock("master_branch_lock") {
            when {
                
                branch "main"
            }
            steps {
                sh 'ls && docker build -t direction-prod:latest .' 
                sh 'docker tag direction-prod:latest olaniyikolawole744/direction-prod:latest'
                sh 'docker push olaniyikolawole744/direction-prod:latest' 
                sh 'docker pull olaniyikolawole744/direction-prod:latest \
                && docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  olaniyikolawole744/direction-prod:latest'
                }
            }
        }


        stage('Manage Develop Branch') {
            lock("develop_branch_lock") {
            when {
                
                branch "develop"
            }
            steps {
                sh 'ls && docker build -t direction-dev:latest .'
                sh 'docker tag direction-dev:latest olaniyikolawole744/direction-dev:latest'
                sh 'docker push olaniyikolawole744/direction-dev:latest'
                sh 'docker pull olaniyikolawole744/direction-dev:latest \
                && docker run -d -p 8080:8080 -e loginname=myname -e loginpass=mypass -e api_key=*****  direction-dev:latest'
                }
            }
        }

    }
}

