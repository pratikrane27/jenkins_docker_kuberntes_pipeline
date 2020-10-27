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
    }
}
