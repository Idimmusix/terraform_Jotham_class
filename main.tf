provider "google" {
    credentials = file(var.credentials)
    project     = "jotham-class-7"
    region      = "us-central1"
}

resource "google_compute_instance" "be_instance" {

  name         = "terraform-vm"

  machine_type = "e2-micro"

  zone         = "us-central1-a"


  boot_disk {

    initialize_params {

      image = "debian-cloud/debian-11"

    }

  }


  network_interface {

    network = "default"

    access_config {}

  }

}
