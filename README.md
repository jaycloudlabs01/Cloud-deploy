# Cloud Deploy — Jay Rathod

A Python Flask web application containerized with Docker and deployed to AWS EC2 using Terraform and GitHub Actions CI/CD pipeline.

## Tech Stack

- **Python Flask** — Web application
- **Docker** — Containerization
- **Docker Hub** — Container registry
- **Terraform** — Infrastructure as Code (AWS EC2, Security Groups)
- **GitHub Actions** — CI/CD pipeline
- **AWS EC2** — Cloud hosting

## How It Works

1. Developer pushes code to GitHub
2. GitHub Actions pipeline triggers automatically
3. Docker builds a fresh image and pushes to Docker Hub
4. Terraform provisions AWS infrastructure (EC2 + Security Group)
5. Server pulls the Docker image and runs the app
6. App is live on public internet

## Project Structure

cloud-deploy/
├── app/
│   ├── app.py              
│   ├── Dockerfile          
│   └── requirements.txt    
├── terraform/
│   └── main.tf             
├── .github/
│   └── workflows/
│       └── deploy.yml      
└── .gitignore

## Infrastructure

- Cloud Provider: AWS us-east-1
- Instance Type: t3.micro Free Tier
- OS: Amazon Linux 2
- Ports: 5000 for App, 22 for SSH

## Secrets Required

- DOCKER_USERNAME - Docker Hub username
- DOCKER_PASSWORD - Docker Hub access token
- AWS_ACCESS_KEY_ID - AWS IAM access key
- AWS_SECRET_ACCESS_KEY - AWS IAM secret key

## Author

Jay Rathod - Cloud Infrastructure Engineer
GitHub: jaycloudlabs01
Email: jaycloudlabs@gmail.com