provider "google" {
 
  project = "aswini-447207"
  zone = "us-central1-a"
}
locals {
  names= ["instance1","instance2"]
}
resource "google_compute_instance" "int" {
    for_each = toset(local.names)
    name = "dude-${each.key}"
    machine_type = "e2-medium"

    boot_disk {
      initialize_params {
        image = "centos-cloud/centos-stream-9"
      }
    }

    network_interface {
      network = "default"
      access_config {} 
    }
}

