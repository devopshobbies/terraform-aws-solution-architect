resource "aws_volume_attachment" "ebs_vol_att" {
  device_name = var.ebs_device_name
  instance_id = var.instance_id

  volume_id   = aws_ebs_volume.ebs_vol.id
}

resource "aws_ebs_volume" "ebs_vol" {

  availability_zone = var.availability_zone
  size              = var.ebs_vol_size
  encrypted = var.encrypt_ebs
}