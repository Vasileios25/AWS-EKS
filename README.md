#  AWS EKS Cluster with Terraform (Work in Progress)

##  Overview
This project provisions a fully functional Amazon EKS cluster using Terraform, following real-world DevOps and cloud infrastructure practices:
1. **Custom VPC**
2. **Two public subnets** across different Availability Zones.
3. **Internet Gateway** and **Route Tables**
4. **Amazon EKS Control Plane**: Serves simple php pages for login,logout,register, a welcome page,db connection.
5. **Managed EC2 Node Group (worker nodes)**
6. **IAM roles & policy attachments**
7. **kubectl access** to the cluster
8. **pvc,pv** for persistent nginx data after failed pod


The goal is to create a clean, production-style environment that will later be extended with private networking, add-ons, CI/CD, and application deployments.

---

##  Current Status
 Working components:
- VPC created with /16 CIDR
- 2 public subnets created via cidrsubnet()
- Internet Gateway + public route table (0.0.0.0/0)
- EKS cluster successfully deployed
- Managed NodeGroup running in public subnets
- IAM roles for worker nodes (CNI, WorkerNodePolicy, ECR read-only)
- AWS SSO workflow for secure admin access
- kubectl connected via generated kubeconfig

 In progress:
- Refactoring VPC into Terraform modules
- Moving worker nodes to private subnets (production standard)
- Deploying a sample microservice to EKS
- Implementing CI/CD pipeline (GitHub Actions → ECR → EKS)
- Adding EKS add-ons (ALB Controller, Autoscaler, Metrics Server)

---

##  What I’ve Learned So Far
- Strengthened understanding of **AWS VPC architecture(subnets, route tables, IGW, CIDR math with cidrsubnet)**
- Gained confidence deploying **EKS clusters** programmatically 
- Practiced debugging common EKS issues like:
    1)NodeGroup hanging on creation
    2)Missing route tables
    3)IAM trust relationships

---

##  Next Steps
1. Finish PHP–Vault integration using dynamic secret retrieval  
2. Migrate Vault config from file storage to HA backend (optional)  
3. Deploy same stack on **Kubernetes** using **Helm**  
4. Integrate **Terraform** for infrastructure provisioning  
5. Add monitoring (Prometheus + Grafana) for observability

---

##  Project Context
This is a **personal learning project**, not production-ready code.  
Its purpose is to document my growth as a Cloud / DevOps engineer — from manual operations to automated, secure infrastructure design.

I started this to connect my interests in:
- **AWS DevOps**
- **Networking**
- **Automation**

---

My aim is to demonstrate:
- Curiosity and willingness to explore complex topics  
- Practical, hands-on problem solving  
- Continuous improvement mindset  

---

## Tech Stack
| Component          | Purpose                                   |
| ------------------ | ----------------------------------------- |
| **Terraform**      | Infrastructure as Code                    |
| **AWS EKS**        | Kubernetes control plane                  |
| **EC2 Node Group** | Worker nodes running pods                 |
| **AWS IAM**        | Role & policy management                  |
| **AWS SSO**        | Secure identity authentication            |
| **kubectl**        | Kubernetes interaction                    |
| *(Future)*         | Helm, Prometheus, Grafana, GitHub Actions |




## Getting Started

### Prerequisites
- AWS account with SSO enabled
- Terraform v1.7+
- kubectl
- AWS CLI v2
- Correct IAM permissions to deploy EKS

### Clone
```bash
git clone https://your-repo-url.git
cd LempStackVaultDocker

   ```

2. Create a `.env` file for environment variables (database credentials) if not using Vault yet.

3. Build and start the Docker containers:
   ```bash
   docker-compose up --build
   ```

### Executing program

Connect to the Cluster:
```bash
aws eks update-kubeconfig --region us-east-1 --name <cluster_name>

```


##  Author
**Vasileios Siaploulis**  
Cloud / DevOps Engineer in progress 
Passionate about Linux, networking, and secure automation.  



---
