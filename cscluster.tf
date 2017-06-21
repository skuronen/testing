##############################################################################
# Require terraform 0.9.3 or greater
##############################################################################
terraform {
  required_version = ">= 0.9.3"
}
##############################################################################
# IBM Cloud Provider
##############################################################################
# See the README for details on ways to supply these values
provider "ibmcloud" {
  bluemix_api_key = "${var.bxapikey}"
  softlayer_username = "${var.slusername}"
  softlayer_api_key = "${var.slapikey}"
}

##############################################################################
# CS Cluster
##############################################################################
resource "ibmcloud_cs_cluster" "test_cs_cluster" {
    name = "test"
    datacenter = "${var.datacenter}"
    machine_type = "free"
    isolation = "public"
    workers = [{name="worker1",  action="add"},]
    org_guid = "sami.kuronen@fi.ibm.com"
    space_guid = "dev-fra"
    account_guid = "ebc4cdb8c002a13ef9e23794c5e43d56"
}


#name - (Required) Name of the cluster.
#datacenter - (Required) The data center of the worker nodes.
#org_guid - (Required) The GUID for the Bluemix organization that the cluster is associated with.
#space_guid - (Required) The GUID for the Bluemix space that the cluster is associated with.
#account_guid - (Required) The GUID for the Bluemix account that the cluster is associated with.
#workers - (Required) The worker nodes that needs to be added to the cluster.



##############################################################################
# Variables
##############################################################################
variable bxapikey {
  description = "Place here"
}
variable slusername {
  description = "Place here"
}
variable slapikey {
  description = "Place here"
}
variable datacenter {
  description = "ams03"
}


##############################################################################
# Outputs
##############################################################################

