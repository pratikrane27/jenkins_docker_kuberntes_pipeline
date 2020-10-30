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
            steps {
                sh "docker build -t prince2796/spring-docker-kubernetes . "
            }
        }
        stage("Docker push") {
            steps {
                withCredentials([string(credentialsId: 'DOCKER_CRED', variable: 'DOCKER_CRED')]) {
                    sh "docker login -u prince2796 -p ${DOCKER_CRED} "
            }
            sh "docker push prince2796/spring-docker-kubernetes:alphine.1 "
            }
            
        }
        stage("Deploy on gke") {
            steps {
               step([$class:'KubernetesEngineBuilder',
                    projectID: "thinking-field-271717",
                    clusterName: "cluster-1",
                    zone: "us-central1-c",
                    manifestPattern: 'deployment.yml',
                    credentialsId: "gke",
                    verifyDeployments: true

               ])
            }
            post {
                success {
                    echo "Deployed successfully on gcp"
                }
                failure {
                    echo "fail to deploy"
                }
            }
        }
    }
}
