variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  default     = ""
  sensitive   = true
}

variable "ssh_fingerprint" {
  description = "Fingerprint of your SSH key"
  type        = string
  default     = ""
  sensitive   = true
}

variable "droplet_image" {
  description = "Image identifier of the OS in DigitalOcean"
  type        = string
  default     = "ubuntu-24-04-x64"
}

variable "droplet_region" {
  description = "Droplet region identifier where the droplet will be created"
  type        = string
  default     = "nyc1"
}

variable "droplet_size" {
  description = "Droplet size identifier"
  type        = string
  default     = "s-1vcpu-1gb"
}