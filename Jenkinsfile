pipeline {
  agent any
  stages {
    stage('Lint') {
      steps {
        sh 'tidy -q -e *.html'
      }
    }
    stage('Push to Dockerhub') {
      steps {
      docker push dinatahoun/devops-capstone:tagname
        }
      }
    }
    stage('Build Docker Image') {
      steps {
        sh 'docker build -t webserver-image:v1 .'
      }
    }
}