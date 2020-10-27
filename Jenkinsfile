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
        }
    }
}
