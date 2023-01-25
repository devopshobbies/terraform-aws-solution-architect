resource "aws_efs_file_system" "efs_fs" {
  creation_token = var.token_name
  availability_zone_name = var.availability_zone_name

  encrypted = var.encryption
  throughput_mode = var.throughput_mode

  performance_mode = var.performance_mode

  provisioned_throughput_in_mibps = var.throughput_mode == "provisioned" ? var.provisioned_throughput_in_mibps_val : null

  lifecycle_policy {
    transition_to_ia = var.infrequent_access_transition_dur
  }

  tags = {
    Name = var.tag_name
  }

}