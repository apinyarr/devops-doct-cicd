output "Linux_IP" {
  value = module.ec2_linux_runner.public_ip
}

output "Windows_IP" {
  value = module.ec2_windows_runner.public_ip
}