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

output "instance_ip" {
    value = google_compute_instance.be_instance.network_interface[0].access_config[0].nat_ip
}


variable "credentials" {
    type = string
    description = "This crednetials is the best thing after sliced bread"
    default = "C:\\Users\\MR DEJI\\idimma\\jotham\\terraform\\jotham-class-7-8fa445ebbd11.json"
}