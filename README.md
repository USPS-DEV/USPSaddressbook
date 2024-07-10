

**Project Setup Guide**

**Project Onboarding**
- Created a new organization on GitHub.
- Created a new repository initialized with a README file & initial project structure
- Setup Branch Protection
  Branch Protection Rules: Configured branch protection rules to enforce quality and security controls on our main, rules such as
  Require pull request reviews before merging.
  Restrict who can push to the branch directly (ideally, only administrators).
- invited all team members to join the organization
- Create and Assign Teams
- Assign Permissions: Assign appropriate permissions to teams rather than individuals.
- Limit Collaborators
--------------------------------------------------------------------------------------------------------------------------------------
**Jenkins Server Setup**

T**ask 1: Setting Up the Jenkins Server**
  - Create a security group for the Jenkins server with access for SSH and web UI.
  - Use Terraform to launch an EC2 instance, attach the security group, and install Jenkins.

**Sub-task Configuring Jenkins**

  - Access Jenkins through http://<jenkins-public-ip>:8080.
- Engineer 2:
  - Install essential Jenkins plugins:
    - Installed all neccesary jenkins plugins needed  such as;
    - Terraform plugin
    - SonarQube Scanner
    - SSH Agent
    - Email Extension
  Setup essential tools like
    - Git
    - sonar-scanner

**Terraform Node Setup**

**Task 3: Setting Up the Terraform Node**
  - Create a security group with SSH access for the Terraform node.
  - Use Terraform to launch an EC2 instance, attach the security group, and enable remote access.

Task 4: Installing and Verifying Terraform
  - Use user data to install Terraform on the EC2 instance.
  - Verify that Terraform is installed and functioning correctly.

**Jenkins and Terraform Node Integration**

**Task 5: Integrating Jenkins with the Terraform Node**

  - Add the Terraform node to Jenkins through Manage Jenkins > Manage Nodes.
  - write a groovy declarative pipeline script to run our pipeline job 
  - Configure Jenkins jobs to execute Terraform commands on the node.

**EKS Cluster Deployment**

**Task 6: Deploying the EKS Cluster**

**Subtask 6.1: Networking Setup**

  - created a VPC module using the offical aws terraform module
  - modified the code to proper network security and configuration of subnets.
  - created an EKS module using the offical aws terraform module
  - created an aws-alb-controller using the offical module
  - created  kubernetes_service_account using the resource block
  - created helm_release using the resource block

**Subtask 6.2: EKS Deployment**

  - created an EKS module using the offical module
  - added some cluster_addons such as
    coredns 
    kube-proxy
    vpc-cni
    aws-ebs-csi-driver
  - create a manage_aws_auth_configmap
  - create_aws_auth_configmap
  - created 3 namespaces (gateway, directory, analytics) using the resource blocck
  - deployed through our jenkins pipeline
  - Verify cluster accessibility, and confirm networking setup.

**Task 7: Configuring Role-Based Access**

  - Set up role-based access control (RBAC) for the EKS cluster using Terraform.
  - Ensure team members are assigned appropriate roles for accessing EKS resources.
