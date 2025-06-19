
#считываем данные об образе ОС
data "yandex_compute_image" "ubuntu_2204_lts" {
  family = "ubuntu-2204-lts"
}

resource "yandex_compute_instance" "vm" {
  count = 2
  name        = "vm${count.index}" #Имя ВМ в облачной консоли
  hostname    = "vm${count.index}" #формирует FDQN имя хоста, без hostname будет сгенрировано случаное имя.
  platform_id = "standard-v3"
  zone        = "ru-central1-a" #зона ВМ должна совпадать с зоной subnet!!!

  resources {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu_2204_lts.image_id
      type     = "network-hdd"
      size     = 10
    }
  }
  
  lifecycle{
    ignore_changes = [boot_disk.0.initialize_params.0.image_id]
  }

  metadata = {
    user-data          = file("./cloud-init.yml")
    serial-port-enable = 1
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop_a.id #зона ВМ должна совпадать с зоной subnet!!!
    nat                = true
  }
}

resource "yandex_lb_target_group" "group1" {
  name = "group1"

  dynamic "target" {
    for_each = yandex_compute_instance.vm
    content {
      subnet_id = yandex_vpc_subnet.develop_a.id
      address = target.value.network_interface.0.ip_address
    }
  }
}

resource "yandex_lb_network_load_balancer" "balancer1" {
  name = "balancer1"
  deletion_protection = "false"
  listener {
    name = "my-lb1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }

  attached_target_group {
    target_group_id = yandex_lb_target_group.group1.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}

