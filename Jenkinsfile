pipeline {
  agent {
    label 'node_build'
  }
  stages {
    stage('Pre-check') {
      steps {
        sh 'node -v'
      }
      post {
        failure {
          echo 'Build envorinment error: nodejs is missing...'
        }
        success {
          echo 'Build envorinment: OK '
        }
      }
    }
    stage('Build') {
      steps {
        sh 'npm install'
      }
      post {
        failure {
          echo 'Build error...'
        }
        success {
          echo 'Build: OK '
        }
      }
    }
  }
}