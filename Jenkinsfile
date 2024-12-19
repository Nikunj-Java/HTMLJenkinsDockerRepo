pipeline {
    agent any
    environment {
        DOCKER_IMAGE = "my-html-website"
        GITHUB_REPO = "https://github.com/Nikunj-Java/HTMLJenkinsDockerRepo.git"
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning Repository"
                git branch: 'main', url: "${GITHUB_REPO}"
            }
        }

        stage('Build Docker Images') {
            steps {
                echo "Building Docker Image"
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                echo "Running Docker Image in a Container"
                script {
                    sh """
                        docker stop website-container || true
                        docker rm website-container || true
                        docker run -d --name website-container -p 80:80 ${DOCKER_IMAGE}
                    """
                }
            }
        }
    }

    post {
        always {
            echo "Pipeline Executed Successfully"
        }
    }
}
