pipeline {
    agent any
    tools {
        maven "maven"
    }
    stages {
        stage("Building maven project") {
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo "Artificat is generated"
                    archiveArtifacts artifacts: '**/*.jar', followSymlinks: false
                }
                failure {
                    echo "compilation failed"
                }
            }
        }
        stage("Docker build") {
            sh "docker -t prince2796/spring-docker-kubernetes . "
        }
        stage("Docker push") {
            withCredentials([string(credentialsId: 'Docker_hub_cred', variable: '')]) {
                sh "docker login -u prince2796 -p ${Docker_hub_cred} "
            }
            sh "docker push prince2796/spring-docker-kubernetes "
        }
    }
}
