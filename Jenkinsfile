pipeline {
    agent { label 'arthur' }
    stages {
        stage('Docker Build') {
            steps {
                sh 'docker build -t spring-petclinic:latest .'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f spring-petclinic || true
                    docker run -d --name spring-petclinic -p 8080:8080 --restart unless-stopped spring-petclinic:latest
                '''
            }
        }
    }
}
