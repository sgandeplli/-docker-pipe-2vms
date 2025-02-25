provider "google" {
 
  project = "mythic-inn-420620"
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
        image = each.key == "instance2" ? "debian-cloud/debian-12" : "centos-cloud/centos-stream-9"
      }
    }

    network_interface {
      network = "default"
      access_config {} 
    }
}

