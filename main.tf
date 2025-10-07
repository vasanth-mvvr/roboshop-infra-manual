resource "aws_instance" "roboshop" {
  for_each = var.instances

  ami = data.aws_ami.ami_info.id
  instance_type = each.value
  vpc_security_group_ids = [ var.sg_id ]

  tags = merge(
    var.common_tags,
    {
        Name = "${var.project}-${var.environment}"
    }
  )
}

resource "aws_route53_record" "roboshop" {
  for_each = aws_instance.roboshop
  zone_id = var.zone_id
  name = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type = "A"
  ttl = 1
  records = each.key == "frontend"? [ each.value.public_ip ] : [ each.value.private_ip ]
  
}