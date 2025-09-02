pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub-credentials')
        DOCKER_IMAGE = "alaaallam2/flaskapp"
        CONTAINER_NAME = "flaskapp-container"
        APP_PORT = "8080"
    }

    stages {
        stage('Clone Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/alaaallam2/flaskapp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    sh "echo $DOCKER_HUB_CREDENTIALS_PSW | docker login -u $DOCKER_HUB_CREDENTIALS_USR --password-stdin"
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh "docker rm -f $CONTAINER_NAME || true"
                    sh "docker pull $DOCKER_IMAGE"
                    sh "docker run -d --name $CONTAINER_NAME -p $APP_PORT:8080 $DOCKER_IMAGE"
                }
            }
        }

        stage('Test App') {
            steps {
                script {
                    sh "sleep 5"
                    sh "curl -f http://localhost:$APP_PORT || (echo 'App did not respond!' && exit 1)"
                }
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully! Your Flask app is up and running 🚀"
        }
        failure {
            echo "❌ Pipeline failed! Please check logs."
        }
    }
}

