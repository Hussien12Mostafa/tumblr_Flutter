pipeline {
    agent any
    stages {
        stage('build') {
            
            steps {
                sh 'echo docker build -t flutter_img .'
            }
        }

	stage('deploy') {
            
            steps {
                sh 'echo docker run flutter_img'
            }
        }

     }
}
