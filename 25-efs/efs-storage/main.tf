provider "aws" {
  region = var.region
}

module "efs_storage" {
  source = "../../modules/25-efs/efs-storage"

  token_name = var.token_name
  encryption = var.encryption

  infrequent_access_transition_dur = var.infrequent_access_transition_dur
  tag_name                         = var.tag_name

}