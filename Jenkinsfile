def containerName="html_container"
def imageName="html_image"
def dockerHubUser="nikunj0510"
def tag="latest"

node{

    stage('Checkout Source Code'){
        checkout scm
    }

    stage('Compilation'){
        echo "Compilation Completed"
    }

    stage('Image Build'){
        sh "docker build -t $imageName:${env.BUILD_NUMBER} --pull --no-cache ."
        echo "Image build Completed"
    }

    stage('Run Application'){
        try{

            //stop existing container
            sh "docker rm $containerName-${env.BUILD_NUMBER} -f"
            //start container
            sh "docker run -d --name $containerName -p 80:80 $imageName:${env.BUILD_NUMBER}"
            
        }catch (error){

        }finally{
            
        }
    }
}