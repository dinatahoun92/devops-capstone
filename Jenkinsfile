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
                steps {
         withAWS(credentials: 'aws', region: 'us-west-2') {
                      sh "aws eks update-kubeconfig --name capston"
                      sh "kubectl config use-context arn:aws:eks:us-west-2:127541518877:cluster/capston"
                      sh "kubectl set image deployment/capstone capston=image:v2"
                      sh "kubectl apply -f deploy.yml"
                  }
              }
        }
    }
}