data "ibm_resource_group" "default" {
  name = var.resource_group_name
}
resource "ibm_resource_instance" "cos_instance" {
  name              = "tutorial-instance"
  resource_group_id = data.ibm_resource_group.default.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}
resource "ibm_resource_instance" "secrets_manager_instance" {
  name              = "secrets_manager"
  resource_group_id = data.ibm_resource_group.default.id
  service           = "secrets-manager"
  plan              = "lite"
  location          = "us-south"
}
resource "ibm_cos_bucket" "tutorial-bucket" {
  bucket_name           = var.bucket_name
  resource_instance_id  = ibm_resource_instance.cos_instance.id
  cross_region_location = var.region
  storage_class         = var.storage
}

