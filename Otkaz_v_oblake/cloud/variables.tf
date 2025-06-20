variable "cloud_id" {
  type    = string
  default = "b1gnh4gft3n8r401os0m"
}
variable "folder_id" {
  type    = string
  default = "b1gppvvk1mpl2kum0b2m"
}

variable "test" {
  type = map(number)
  default = {
    cores         = 2
    memory        = 1
    core_fraction = 20
  }
}
