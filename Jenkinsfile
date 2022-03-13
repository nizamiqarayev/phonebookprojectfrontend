pipeline {
    agent any
    tools {
        maven 'apache-maven-3.8.4'
        }
    stages {
        stage('Building the Docker Image') {
            steps {
                 script {
                     sh 'docker build -t niz242001/pbprojectfront .'
                 }
            }
        }
        stage('Deploying to Docker Hub') {
            steps {
                 script {
                     withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                         sh 'docker login -u niz242001 -p ${dockerhubpwd}'
                     }
                     sh 'docker push  niz242001/pbprojectback'
                 }
            }
        }
    }
}