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
        sh 'docker build -t dinatahoun/devops-capstone .'
      }
    }
    stage('Push to Dockerhub') {
      steps {
     withDockerRegistry([credentialsId: "docker",url: ""]) {
        sh 'docker push dinatahoun/devops-capstone'
                }
            }
        }
        stage('Deployment') {
              steps{
                  withAWS(credentials: 'aws', region: 'us-west-2') {
                      sh "kubectl get deployment"
                    
                  }
              }
        }
    }
}