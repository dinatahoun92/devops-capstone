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
               withAWS(credentials: 'aws', region: 'us-west-2') {
                      sh "aws eks --region us-west-2 update-kubeconfig --name capston"
                      sh "kubectl config use-context arn:arn:aws:eks:us-west-2:127541518877:cluster/capston"
                      sh "kubectl set image deploy dinatahoun/devops-capstone"
                      sh "kubectl apply -f deployment/deploy.yml"
                      sh "kubectl get nodes"
                      sh "kubectl get deployment"
                      sh "kubectl get pod -o wide"
                      sh "kubectl get service/capston"
                  }
              }
        
    }
}