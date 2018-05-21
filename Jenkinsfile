pipeline {
  agent {
    label 'node_build'
  }
  stages {
    stage('Pre-check') {
      steps {
        sh 'npm -v'
      }
      post {
        failure {
          echo 'Build envorinment error: nodejs is missing...'
        }
        success {
          echo 'Build envorinment: OK'
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

    stage('Test') {
      steps {
        sh 'npm start'
        sh 'npm test'
      }
      post {
        failure {
          echo 'Test error...'
        }
        success {
          echo 'Test: OK'
        }
        cleanup {
          #sh 'pm2 stop all'
        }
      }
    }
  }
}