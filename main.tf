/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 25
*/

locals {
  env_type    = "{TESTING/PROD/ETC}"
  keyname     = "{YOUR_KEYNAME}"
  #You can use the "get-your-ip.sh" script and then end this variable in the vars.tf
  your_ip     = ["{YOUR_IP}/32"]
}
/*Create Role to Pull from S3*/
module "iam" {
  source = "./modules/iam"
}

/* BUILD NETWORK */
module "network" {
  source = "./modules/network"
}

module "securitygroups" {
  source  = "./modules/security-groups"
  your_ip = local.your_ip
  vpc_id  = module.network.valheim-vpc

}

/* BUILD SERVER SECTION*/
#####!!!! ONLY HAVE ONE SERVER MODULE UNCOMMENTED AT A TIME !!!!#####
## This is for the more expensive on-demand server. Less worry about backups here, albeit you should still backup, fam.

module "server" {
  source               = "./modules/dedicated-server"
  instance_type        = "t3.medium"
  volume_size          = "30"
  volume_type          = "gp2"
  private_ip           = "10.10.10.69"
  subnet_id            = module.network.network_subnet_id
  security_groups      = module.securitygroups.valheim_security_groups
  iam_instance_profile = module.iam.ec2_s3_read_access
  key_name             = local.keyname
  env_type             = local.env_type
  name_tag             = "Valheim Server"
  user_data            = file("./scripts/bootstrap.sh")
}

## This is for the Cheaper Spot Instance Server. Beware, you will want to do your due diligence in ensuring regular backups are done.
/*
module "server" {
    source                  = "./modules/dedicated-server-spot"
    instance_type           = "t3.medium"
    volume_size             = "30"
    volume_type             = "gp2"
    subnet_id               = module.network.network_subnet_id
    security_groups         = module.securitygroups.valheim_security_groups
    iam_instance_profile    = module.iam.ec2_s3_read_access
    key_name                = local.keyname
    env_type                = local.env_type
    name_tag                = "Spot Valheim Server"
    user_data               = file("./scripts/bootstrap.sh")
}*/