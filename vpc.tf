module "vpc" {
  source = "github.com/avishni01/terraform-common-resources.git/aws"

  # Module variables

  enable_vpc           = var.enable_vpc
  vpc_cidr             = var.vpc_cidr
  vpc_name             = join("-", [var.prefix, "vpc"])
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  create_igw           = var.create_igw
  enable_nat_gateway   = var.enable_nat_gateway
  single_nat_gateway   = var.single_nat_gateway

  # Subnet settings
  public_subnet_count         = var.public_subnet_count
  public_subnet_network_start = 1
  public_subnet_suffix        = "public"
  public_subnet_tags          = { Tier = "public" }
  public_route_table_tags     = { Tier = "public" }
  map_public_ip_on_launch     = true

  #private_subnet_cidrs         = ["10.0.101.0/24", "10.0.102.0/24"]
  private_subnet_count         = var.private_subnet_count
  private_subnet_network_start = 101
  private_subnet_suffix        = "private"
  private_subnet_tags          = { Tier = "private" }
  private_route_table_tags     = { Tier = "private" }

}