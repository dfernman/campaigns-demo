pipeline {
    agent {
        node {
            label 'dockerhost-build-server'
        }
    }

    tools {
        maven 'maven-3.9.6'
    }

    stages {

        stage('Packaging') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('cleanup') {
            steps {
                sh 'docker rm -f campaigns-demo-server || true'
                sh 'docker system prune -a --volumes --force --filter "label=campaigns-demo-server"'
            }
        }

        stage('build image') {
            steps {
                sh 'docker build -t dfernman/campaigns-demo:v1 --label campaigns-demo-server .'
            }
        }

        stage('run container') {
            steps {
                sh 'docker run -d --name campaigns-demo-server --label campaigns-demo-server -p 8090:8080 dfernman/campaigns-demo:v1'
            }
        }
    }
}
