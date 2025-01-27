pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS = 'dockerhub-creds'
        dockerHubUser = 'rohannegi11'
        dockerHubPass = 'rohan6814@@'
    }

    stages {
        stage('Code Checkout') {
            steps {
                git url: 'https://github.com/rohannegi1104/java-code.git', branch: 'main'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${dockerHubUser}/javaproject:latest .'
                    sh 'docker images'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS, passwordVariable: 'dockerHubPass', usernameVariable: 'dockerHubUser')]) {
                    sh 'docker images ${dockerHubUser}/javaproject:latest'
                    sh 'docker login -u ${dockerHubUser} -p ${dockerHubPass}'
                    sh 'docker tag ${dockerHubUser}/javaproject:latest ${dockerHubUser}/javaproject:latest'
                    sh 'docker push ${dockerHubUser}/javaproject:latest'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d ${dockerHubUser}/javaproject:latest'
            }
        }
    }
}
