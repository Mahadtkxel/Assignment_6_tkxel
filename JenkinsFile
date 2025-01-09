def p 

pipeline {
    agent any
    
    parameters {
        string(name: "BRANCH_NAME", defaultValue: "master")
        string(name: "GIT_URL", defaultValue: "https://github.com/Mahadtkxel/python-project-blueprint.git")
        string(name: "TOOL_NAME", defaultValue: "sonarqube")
        string(name: "SONAR_PROJECT", defaultValue: "tkxelassignment1")
        string(name: "IMAGE_TAG", defaultValue: "tkxelassignment_1")
        string(name: "DOCKERFILE", defaultValue: "dev.Dockerfile")
    }
    
    stages {
        stage('Checkout Code') {
            steps {
                git branch: params.BRANCH_NAME, url: params.GIT_URL
            }
        }
        stage('Sonarqube Code Analysis') {
            environment {
                scannerHome = tool name: params.TOOL_NAME
            }
            steps {
                script {
                    withSonarQubeEnv(params.TOOL_NAME) {
                        sh """
                            ${scannerHome}/bin/sonar-scanner \
                                -Dsonar.projectKey=${params.SONAR_PROJECT} \
                                -Dsonar.projectName=${params.SONAR_PROJECT} \
                                -Dsonar.sources=.
                        """
                    }
                }
            }
        }

        stage("Building Docker Image") {
            steps {
                script {
                    sh "whoami && docker build -t ${params.IMAGE_TAG} -f ${params.DOCKERFILE} ."
                }
             }
        }
    }
}