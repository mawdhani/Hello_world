data "hashicorp_ssh_key" "ssh_key" {
  name = "your_ssh_key_name"
}

resource "hashicorp_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = data.external.droplet_name.result.name
  region = "fra1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [
    data.hashicorp_ssh_key.ssh_key.id
  ]
  connection {
    host        = self.ipv4_address
    user        = "root"
    type        = "ssh"
    private_key = file(var.private_key)
    timeout     = "2m"
  }
}



  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # Install Apache
      "apt update",
      "apt -y install apache2"
    ]
  }
}