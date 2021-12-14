pipeline
{
    agent any
    
    environment{
        dockerImage=''
        registery='minalabib07/flutter_image'
        registerycredentials='docker_hub_cred'
    }
    
    stages{
        stage('checkout'){
            steps{
             checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'github_tocken', url: 'https://github.com/Hussien12Mostafa/Tumplr_Flutter.git']]])   
            }
        }
        
        stage('build Docker image'){
            steps{
                script{
                    dockerImage= docker.build registery
                }
            }
        }
        
        stage('uploading image'){
            steps{
                script{
                    docker.withRegistry( '', registerycredentials ) {
                    dockerImage.push()
                    }
                }
            }
        }
    }
}

