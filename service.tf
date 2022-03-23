data "cloudfoundry_org" "org" {
    name = var.org
}

data "cloudfoundry_space" "space" {
    org = data.cloudfoundry_org.org.id
    name = var.space
}

# see "cf marketplace" for a list of services
data "cloudfoundry_service" "service" {
  name = "stackit-postgresql11"
}

resource "cloudfoundry_service_instance" "instance" {
  space        = data.cloudfoundry_space.space.id
  # see "cf marketplace" for a list of plans
  name         = "mylittlepg"
  service_plan = data.cloudfoundry_service.service.service_plans["stackit-postgresql-single-small"]
  json_params = "{\"sgw_acl\":\"193.148.160.0/19\"}"
}

resource "cloudfoundry_service_key" "key1" {
  service_instance = cloudfoundry_service_instance.instance.id
  name = "key1"
}