resource "aws_lightsail_instance" "lightsail_instance" {
  name              = var.project_name
  availability_zone = "${var.aws_region}a"
  blueprint_id      = var.lightsail_blueprints["wordpress"]
  bundle_id         = var.bundle_id
}

# Create a public static IP address on Lightsail
resource "aws_lightsail_static_ip" "static_ip" {
  name = "${var.project_name}_static_ip"
}

# Attaches static IP to instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attach" {
  static_ip_name = aws_lightsail_static_ip.static_ip.name
  instance_name  = aws_lightsail_instance.lightsail_instance.name
}

