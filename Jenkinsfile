pipeline
{
    agent any
    
    environment{
        dockerImage=''
        registery='minalabib07/flutter_image'
        registerycredentials='docker_hub_cred'
    }
    
    stages{
        
        stage('clean'){
            steps{
                script{
                    sh'docker rmi minalabib07/flutter_image'
                }
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
post {
    failure {
        mail to: 'mina.labib00@eng-st.cu.edu.eg ,mohamed.ahmedmoreb@gmail.com',
             subject: "Failed Pipeline: ${currentBuild.fullDisplayName}",
             body: "Something is wrong with ${env.BUILD_URL}"
            }
    }
}

