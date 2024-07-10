pipeline{
    agent any
    
    stages{
        stage("Code Clone"){
            steps{
                echo "Cloning the Code"
                git url:"https://github.com/i-yashi/Weather-App-CICD.git", branch:"main"
            }
        }
        stage("Build"){
            steps{
                echo "Building the image"
                sh "docker build -t weather-sense ."
            }
        }
        stage("Push into Docker Hub"){
            steps{
                echo "Pushing the docker image to docker hub"
                withCredentials([usernamePassword(credentialsId: "dockerhub", passwordVariable: "dockerhubPass", usernameVariable: "dockerhubUser")]){
                    sh "docker tag weather-sense ${env.dockerhubUser}/weather-sense:latest"
                    sh "docker login -u ${env.dockerhubUser} -p ${env.dockerhubPass}"
                    sh "docker push ${env.dockerhubUser}/weather-sense:latest"
                }
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploying the docker image"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}