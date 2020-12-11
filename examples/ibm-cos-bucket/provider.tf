variable "ibmcloud_api_key" {
  description = "Enter your IBM Cloud API key. To create an IBM Cloud API key, go to: https://cloud.ibm.com/iam/apikeys"
}

provider "ibm" {
  ibmcloud_api_key      = var.ibmcloud_api_key
}
