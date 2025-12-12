# Terraform AWS Nginx Project

This repository contains a Terraform project to provision a **complete AWS infrastructure** for hosting a web application (Nginx or Node.js) using best practices.

---

## **Project Architecture**

* **VPC** with public subnets
* **Internet Gateway** for internet access
* **Route Tables** for subnet routing
* **Security Groups** for ALB and EC2
* **Application Load Balancer (ALB)**
* **Auto Scaling Group (ASG)** with EC2 instances
* **Modules** for VPC, ALB, and ASG
* Terraform **remote state** stored in S3 with DynamoDB locking

Diagrammatically:

```
ALB → Auto Scaling Group → EC2 Instances
VPC → Public Subnets → Internet Gateway
```

---

## **Prerequisites**

* AWS account with appropriate IAM permissions
* Terraform v1.x installed
* Git installed
* Docker installed (if deploying Node.js app)

---

## **Setup Instructions**

### **1. Clone the repository**

```bash
git clone https://github.com/jaffarmuhammad052-maker/terraform-aws-nginx-project.git
cd terraform-aws-nginx-project
```

### **2. Configure Terraform Variables**

Create a `terraform.tfvars` file (example):

```hcl
region       = "us-east-1"
vpc_cidr     = "10.0.0.0/16"
project      = "dev-project"

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

azs = [
  "us-east-1a",
  "us-east-1b"
]

my_ip = "YOUR_PUBLIC_IP/32"
```

> Replace `YOUR_PUBLIC_IP` with your IPv4 (use `curl -4 ifconfig.me`).

---

### **3. Initialize Terraform**

```bash
terraform init
```

This will configure the backend, download providers, and initialize modules.

---

### **4. Preview the Infrastructure**

```bash
terraform plan
```

Terraform will show the resources to be created.

---

### **5. Apply the Infrastructure**

```bash
terraform apply
```

Confirm when prompted. Once completed, Terraform will output:

* `alb_url` → public URL of your application

Open it in your browser to verify.

---

### **6. Destroy the Infrastructure (Optional)**

```bash
terraform destroy
```

This will remove all AWS resources created by Terraform.

---

## **Security Note**

* Do **not commit** `.terraform/` or `terraform.tfvars` (contains secrets)
* Use `.gitignore` to avoid pushing sensitive files

---

## **Docker Deployment (Optional)**

1. Build your Node.js image:

```bash
docker build -t my-node-app .
```

2. Run your container:

```bash
docker run -d -p 3000:3000 --name my-node-app my-node-app
```

3. Push to Docker Hub:

```bash
docker tag my-node-app yourdockerhubusername/my-node-app:latest
docker push yourdockerhubusername/my-node-app:latest
```

---

## **Author**

Muhammad Jaffar
GitHub: [jaffarmuhammad052-maker](https://github.com/jaffarmuhammad052-maker)
