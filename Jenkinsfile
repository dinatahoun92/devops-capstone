pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t webserver-image:v1 .'
      }
    }
    stage('Push to Dockerhub') {
      steps {
     withDockerRegistry([credentialsId: "docker"]) {
        sh 'docker push dinatahoun/devops-capstone'
        }
      }
    }
}