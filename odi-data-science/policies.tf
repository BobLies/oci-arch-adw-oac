resource "oci_identity_dynamic_group" "FunctionsServiceDynamicGroup" {
  name = "FunctionsServiceDynamicGroup"
  description = "FunctionsServiceDynamicGroup"
  compartment_id = var.tenancy_ocid
  matching_rule = "ALL {resource.type = 'fnfunc', resource.compartment.id = '${var.compartment_ocid}'}"
  
  provisioner "local-exec" {
       command = "sleep 5"
  }
}

resource "oci_identity_dynamic_group" "DSDynamicGroup" {
  name = "DSDynamicGroup"
  description = "DSDynamicGroup"
  compartment_id = var.tenancy_ocid
  matching_rule = "ALL {resource.type = 'datasciencenotebooksession', resource.compartment.id = '${var.compartment_ocid}'}"
  
  provisioner "local-exec" {
       command = "sleep 5"
  }
}

resource "oci_identity_policy" "ODIDataSciencePolicies" {
  depends_on = [oci_identity_dynamic_group.FunctionsServiceDynamicGroup,
                oci_identity_dynamic_group.DSDynamicGroup]
  name = "ODIDataSciencePolicies"
  description = "Example List of Policies Required for this Stack"
  compartment_id = var.tenancy_ocid
  statements     = [
    "allow group Administrators to manage streams in tenancy",
    "allow group Administrators to manage stream-push in tenancy",
    "allow group Administrators to manage buckets in tenancy",
    "allow group Administrators to manage objects in tenancy",
    "allow group Administrators TO read buckets in tenancy",
    "allow group Administrators to read objectstorage-namespaces in tenancy",
    "allow group Administrators to inspect compartments in tenancy",
    "allow group Administrators to use virtual-network-family in tenancy",
    "allow group Administrators to manage data-science-family in tenancy",
    "allow group Administrators to use cloud-shell in tenancy",
    "allow group Administrators to manage repos in tenancy",
    "allow group Administrators to read metrics in tenancy",
    "allow group Administrators to manage tag-namespaces in compartment id ${var.compartment_ocid}",
    "allow group Administrators to use virtual-network-family in compartment id ${var.compartment_ocid}",
    "allow group Administrators to use object-family in compartment id ${var.compartment_ocid}",
    "allow service dataintegration to use virtual-network-family in compartment id ${var.compartment_ocid}",
    "allow dynamic-group DSDynamicGroup to manage data-science-family in tenancy", 
    "allow service datascience to use virtual-network-family in tenancy",
    "allow dynamic-group DSDynamicGroup to manage object-family in tenancy", 
    "allow dynamic-group DSDynamicGroup to manage objects in compartment id ${var.compartment_ocid}", 
    "allow group Administrators to manage objects in tenancy where all {target.bucket.name = '${var.dataflow_logs_bucket_name}', any {request.permission = 'OBJECT_CREATE', request.permission = 'OBJECT_INSPECT'}}",
    "allow group Administrators to manage functions-family in tenancy",
    "allow group Administrators to use functions-family in tenancy",
    "allow service FaaS to read repos in tenancy",
    "allow service FaaS to use virtual-network-family in tenancy",
    "allow dynamic-group FunctionsServiceDynamicGroup to manage all-resources in tenancy",
    "allow group Administrators to use functions-family in tenancy"
  ]
  provisioner "local-exec" {
       command = "sleep 5"
  }
}