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
        sh 'sudo docker build -t webserver-image:v1 .'
      }
    }
    stage('Push to Dockerhub') {
      steps {
     withDockerRegistry([credentialsId: "docker",url: ""]) {
        sh 'sudo docker push dinatahoun/devops-capstone'
                }
            }
        }
    }
}