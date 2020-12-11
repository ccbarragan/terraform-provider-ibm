data "ibm_resource_group" "tutorial_group" {
  name = var.resource_group_name
}
resource "ibm_resource_instance" "cos_instance" {
  name              = "tutorial-instance"
  resource_group_id = data.ibm_resource_group.cos_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}
#resource "ibm_resource_instance" "activity_tracker" {
#  name              = "activity_tracker"
#  resource_group_id = data.ibm_resource_group.cos_group.id
#  service           = "logdnaat"
#  plan              = "lite"
#  location          = "us-south"
#}
#resource "ibm_resource_instance" "metrics_monitor" {
#  name              = "metrics_monitor"
#  resource_group_id = data.ibm_resource_group.cos_group.id
#  service           = "sysdig-monitor"
#  plan              = "lite"
#  location          = "us-south"
#}
resource "ibm_cos_bucket" "tutorial-bucket" {
  bucket_name           = var.bucket_name
  resource_instance_id  = ibm_resource_instance.cos_instance.id
  cross_region_location = var.region
  storage_class         = var.storage
#  activity_tracking {
#    read_data_events     = true
#    write_data_events    = true
#    activity_tracker_crn = ibm_resource_instance.activity_tracker.id
#  }
#  metrics_monitoring {
#    usage_metrics_enabled  = true
#    metrics_monitoring_crn = ibm_resource_instance.metrics_monitor.id
#  }
#  allowed_ip = ["223.196.168.27", "223.196.161.38", "192.168.0.1"]
}

#resource "ibm_cos_bucket" "lifecycle_rule_cos" {
#  bucket_name          = var.bucket_name
#  resource_instance_id = ibm_resource_instance.cos_instance.id
#  region_location      = var.regional_loc
#  storage_class        = var.storage
#  archive_rule {
#    rule_id = var.archive_ruleid
#    enable  = true
#    days    = var.archive_days
#    type    = var.archive_types
#  }
#  expire_rule {
#    rule_id = var.expire_ruleid
#    enable  = true
#    days    = var.expire_days
#    prefix  = var.expire_prefix
#  }
#}
