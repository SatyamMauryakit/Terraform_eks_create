# AWS EKS Cluster Creation with Terraform

## Project Overview
This project allows for the easy creation and management of an AWS EKS (Elastic Kubernetes Service) cluster using Terraform. It automates the provisioning of the necessary AWS infrastructure and helps to streamline the deployment process.

## Prerequisites
- AWS Account
- AWS CLI configured with necessary permissions
- Terraform installed (version X.X.X)
- kubectl installed

## Usage Steps
1. Clone this repository:
   ```bash
   git clone https://github.com/SatyamMauryakit/Terraform_eks_create.git
   cd Terraform_eks_create
   ```
2. Initialize Terraform:
   ```bash
   terraform init
   ```
3. Plan the deployment:
   ```bash
   terraform plan
   ```
4. Apply the configuration:
   ```bash
   terraform apply
   ```
   *Confirm the action when prompted.*
5. Configure kubectl to use the new cluster:
   ```bash
   aws eks --region <region> update-kubeconfig --name <cluster_name>
   ```

## Inputs/Outputs
### Inputs
- `cluster_name`: Name of the EKS cluster.
- `region`: AWS region where the cluster is to be created.
- `node_group`: Configuration for the node group associated with the EKS cluster.

### Outputs
- `kubeconfig`: The configuration needed for kubectl to manage the cluster.
- `cluster_endpoint`: The URL endpoint for the EKS cluster.

## Cleanup Instructions
To clean up and destroy all resources created by Terraform, run:
```bash
tf destroy
```
Confirm the action when prompted. This will remove all resources associated with the EKS cluster.

---

This README provides a comprehensive guide for using the Terraform setup to create an AWS EKS cluster. Ensure you review your configurations before applying any changes.