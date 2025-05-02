# do_test

A simple Terraform project to provision a DigitalOcean droplet with a secure firewall and initial configuration using cloud-init.

## Features

- Deploys a single DigitalOcean droplet with Ubuntu 24.04.
- Sets up a custom `ansible` user with SSH key authentication.
- Installs Python 3, pip, and Docker via cloud-init.
- Configures a firewall to allow only SSH (22), HTTP (80), HTTPS (443), and ICMP.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- A [DigitalOcean API token](https://cloud.digitalocean.com/account/api/tokens)
- Your SSH key added to your DigitalOcean account

## Usage

1. **Clone the repository:**
    ```sh
    git clone https://github.com/yourusername/do_test.git
    cd do_test/terraform
    ```

2. **Set your variables:**
    - Copy `terraform.tfvars.example` to `terraform.tfvars` (if present) or set variables via environment or CLI.
    - Required variables:
        - `do_token` (DigitalOcean API token)
        - `ssh_fingerprint` (Your SSH key fingerprint from DigitalOcean)

3. **Initialize Terraform:**
    ```sh
    terraform init
    ```

4. **Plan the deployment:**
    ```sh
    terraform plan
    ```

5. **Apply the configuration:**
    ```sh
    terraform apply
    ```

6. **Access your droplet:**
    - Find the public IP in the Terraform output or DigitalOcean dashboard.
    - SSH as the default user (e.g., `root` or `ubuntu`) or as `ansible`:
      ```sh
      ssh ansible@<droplet_ip>
      ```

## File Structure

```
terraform/
  main.tf           # Main Terraform configuration
  variables.tf      # Input variables
  outputs.tf        # Output values (e.g., droplet IP)
  digitalocean.tftpl # cloud-init template for droplet provisioning
README.md           # This file
```

## Notes

- The public SSH key in the repo is for demonstration. Replace it with your own for real deployments.
- For production, restrict SSH access in the firewall to your IP.
- Destroy resources when done to avoid charges:
    ```sh
    terraform destroy
    ```

## Resources

- [Terraform DigitalOcean Provider Docs](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs)
- [DigitalOcean Cloud-Init Docs](https://docs.digitalocean.com/products/droplets/how-to/use-cloud-init/

---
