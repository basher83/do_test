provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_droplet" "drop_test" {
  image              = var.droplet_image
  name               = "drop_test"
  region             = var.droplet_region
  size               = var.droplet_size
  backups            = false
  monitoring         = false
  ssh_keys = [
    var.ssh_fingerprint
  ]
}

# Firewall
resource "digitalocean_firewall" "drop_test" {
  name = "only-allow-ssh-http-and-https"

  droplet_ids = [digitalocean_droplet.drop_test.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "1-65535"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}