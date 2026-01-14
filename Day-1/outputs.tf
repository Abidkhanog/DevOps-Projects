output "EIP" {
  description = "Lightsail EIP"
  value = aws_lightsail_static_ip.static_ip.ip_address
}
