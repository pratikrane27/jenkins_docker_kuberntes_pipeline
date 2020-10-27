pipeline {
    agent any
    tool {
        maven "maven"
    }
    stages {
        stage("Build maven project") {
            steps {
                sh 'mvn clean package'
            }
        }
    }
}