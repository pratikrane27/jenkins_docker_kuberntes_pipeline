pipeline {
    agent any
    tools {
        maven "maven"
    }
    environment {
        PROJECT_ID = 'thinking-field-271717'
        CREDENTIALS_ID = 'gke'
        CLUSTER_NAME = 'springdocker'
        LOCATION = 'us-central1-c'

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
               step([$class:'com.google.jenkins.plugins.k8sengine.KubernetesEngineBuilder',
                    projectID: env.PROJECT_ID,
                    clusterName: env.CLUSTER_NAME,
                    zone: env.LOCATION,
                    manifestPattern: 'deployment.yml',
                    credentialsId: env.CREDENTIALS_ID,
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
