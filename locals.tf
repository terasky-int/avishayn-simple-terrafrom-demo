locals {
  vpc_name = join("-", [var.prefix, "vpc"])

  my_public_ip = jsondecode(data.http.my_public_ip.response_body)

}