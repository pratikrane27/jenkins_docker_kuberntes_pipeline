pipeline {
    agent any
    tool {
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
