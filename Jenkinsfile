pipeline
{
    agent any
    stages
    {
        stage('GIT')
        {
            steps
            {
                git 'https://github.com/dhana9000/Application-Deployment-Bahmni.git'
            }
        }
        stage('terraform init')
        {
            steps
            {
                sh 'terraform init .'
            }
        }
        stage('terraform validate')
        {
            steps
            {
                sh 'terraform validate .'
            }
        }
        stage('terraform plan')
        {
            steps
            {
                 sh 'terraform plan -var "access=<access_key> " -var "secret=<secret_key>" -out="aws.plan" .'
            }
        }
        stage('terraform apply')
        {
            steps
            {
                sh 'terraform apply aws.plan'
            }
        }
    }
}

