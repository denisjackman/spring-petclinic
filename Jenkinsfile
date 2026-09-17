pipeline {
    agent { label 'mactire' }
    environment {
        // mactire's Docker runs through homelab's Colima VM, not a system-wide
        // daemon — mactire_jenkins reaches it via a scoped ACL on that socket.
        DOCKER_HOST = 'unix:///Users/homelab/.colima/default/docker.sock'
        // Non-interactive SSH sessions on macOS don't get /usr/local/bin on PATH.
        PATH = "/usr/local/bin:${env.PATH}"
    }
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
