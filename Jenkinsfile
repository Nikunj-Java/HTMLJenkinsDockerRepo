agent any
environment{
    DOCKER_IMAGE="my-html-website"
    GITHUB_REPO="https://github.com/Nikunj-Java/HTMLJenkinsDockerRepo.git"
}

stages{
    stage('Clone Repository'){
        git branch:'main', url:"${GITHUB_REPO}"
        echo"clonning Repository"
    }

    stage('Build Docker Images'){
        echo"Building Docker Images"
        script{
            sh "dockerbuild -t ${DOCKER_IMAGE} ."
        }
    }

    stage('Run Docker Container'){
        echo"Running Docker Images on Docker Container"
        script{
            sh """
            docker stop website-container || true
            dokcer rm website-container || true
            """
            sh "docker run -d --name website-container -p 80:80 ${DOCKER_IMAGE}"
        }
    }

     
}

post{
always{
echo "Pipline Executed Successfully"}
}