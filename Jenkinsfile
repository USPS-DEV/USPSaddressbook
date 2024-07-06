
pipeline {
    agent { node { label 'terraform-node' } } 
    parameters {
                choice(name: 'deploy_choice', choices:['apply','destroy'],description:'The deployment type')
                  }
    environment {
        EMAIL_TO = 'lawrencetech2013@gmail.com'
    }
    stages {
        stage('1.Terraform init') {
            steps {
                echo 'terraform init phase'
                sh 'terraform init'
            }
        }
        stage('2.Terraform plan') {
            steps {
                echo 'terraform plan phase'
                sh 'AWS_REGION=eu-west-2 terraform plan'
            }
        }
        stage('3.Manual Approval') {
            input {
                message "Should we proceed?"
                ok "Yes, we should."
                parameters {
                    choice (name: 'Manual_Approval', choices: ['Approve','Reject'], description: 'Approve or Reject the deployment')
                }
            }
             steps {
                echo "Deployment ${Manual_Approval}"
            }          
        }
        stage('4.Terraform Deploy') {              
            steps { 
                echo 'Terraform ${params.deploy_choice} phase'  
                sh "AWS_REGION=eu-west-2 terraform ${params.deploy_choice}  -target=module.vpc -target=module.eks-cluster --auto-approve"
                sh "chmod +x /home/ubuntu/workspace/eks-cluster/scripts/update-kubeconfig.sh"
                sh("""scripts/update-kubeconfig.sh""")
                // sh "aws eks --region eu-west-2 update-kubeconfig --name usps-cluster && export KUBE_CONFIG_PATH=~/.kube/config"
                sh "AWS_REGION=eu-west-2 terraform ${params.deploy_choice} --auto-approve"
            }
                }
        stage ('5. Email Notification') {
            steps {
               mail bcc: 'lawrencetech2013@gmail.com,monkamtanyi@gmail.com', body: '''Terraform deployment is completed.
               Let me know if the changes look okay.
               Thanks,
               usps team 2,
              +234 818 236 7844''', cc: 'lawrencetech2013@gmail.com', from: '', replyTo: '', subject: 'Terraform Infra deployment completed!!!', to: 'lawrencetech2013@gmail.com'
                          
               }    
          }
     }       
}   
