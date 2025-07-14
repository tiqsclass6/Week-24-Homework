pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        SNYK_ORG = '67615456-3e82-4935-9968-23e1de24cd66'
        SNYK_PROJECT = 'jenkins-test3'
        TRUFFLEHOG_PATH = "/usr/local/bin/trufflehog3"
        JIRA_SITE = 'jira-prod'
        JIRA_PROJECT = 'JT'
        SONARQUBE_URL = "https://sonarcloud.io"
    }

    stages {
        stage('Set AWS Credentials') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkins3'
                ]]) {
                    sh '''
                    echo "Verifying AWS Credentials..."
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    aws sts get-caller-identity
                    '''
                }
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/tiqsclass6/Week-24-Homework'
            }
        }

        stage('Static Code Analysis (SAST) - SonarQube') {
            steps {
                withCredentials([string(credentialsId: 'SONARQUBE_TOKEN', variable: 'SONAR_TOKEN')]) {
                    sh '''
                        sonar-scanner \
                          -Dsonar.projectKey=tiqsclass6_jenkins-test3 \
                          -Dsonar.organization=tiqs \
                          -Dsonar.host.url=$SONARQUBE_URL \
                          -Dsonar.login=$SONAR_TOKEN
                    '''
                }
            }
        }

        stage('Snyk Security Scan') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'SNYK_AUTH_TOKEN', variable: 'SNYK_TOKEN')]) {
                        def snykStatus = sh(script: '''
                            snyk auth $SNYK_TOKEN
                            snyk test || exit 1
                        ''', returnStatus: true)

                        if (snykStatus != 0) {
                            def inputResult = input(
                                message: 'Snyk scan failed. Enter reason for failure (this will be logged to Jira):',
                                parameters: [
                                    text(name: 'REASON', defaultValue: 'Snyk scan found security vulnerabilities', description: 'Describe the reason')
                                ]
                            )
                            createJiraTicket("Snyk Security Scan Failed", inputResult)
                            error("Snyk scan failed!")
                        }
                    }
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan Terraform') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkins3'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform plan -out=tfplan
                    '''
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                input message: "Approve Terraform Apply?", ok: "Deploy"
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'Jenkins3'
                ]]) {
                    sh '''
                    export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                    export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                    terraform apply -auto-approve tfplan
                    '''
                }
            }
        }
    }

    post {
        success {
            script {
                echo 'Terraform deployment completed successfully.'
                def destroyParams = input(
                    message: "Destroy deployed Terraform infrastructure?",
                    ok: "Yes, destroy",
                    parameters: [
                        booleanParam(name: 'DESTROY_RESOURCES', defaultValue: false, description: 'Check to confirm you want to destroy the deployed resources.')
                    ]
                )
                if (destroyParams['DESTROY_RESOURCES']) {
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        credentialsId: 'Jenkins3'
                    ]]) {
                        sh '''
                        export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
                        export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
                        terraform destroy -auto-approve
                        '''
                    }
                } else {
                    echo 'Skipping Terraform destroy as per user input.'
                }
            }
        }

        failure {
            script {
                def inputResult = input(
                    message: 'Pipeline failed. Enter reason (this will be logged to Jira):',
                    parameters: [
                        text(name: 'REASON', defaultValue: 'Unknown error in pipeline', description: 'Describe what failed')
                    ]
                )
                createJiraTicket("Terraform Deployment Failure", inputResult)
            }
        }
    }
}

// Function to Create a Jira Ticket
def createJiraTicket = { String issueTitle, String issueDescription ->
    jiraNewIssue site: "${env.JIRA_SITE}",
                 projectKey: "${env.JIRA_PROJECT}",
                 issueType: "Bug",
                 summary: issueTitle,
                 description: issueDescription,
                 priority: "High"
}
