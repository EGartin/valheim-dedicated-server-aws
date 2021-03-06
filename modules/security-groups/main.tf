/*
* PROJECT: Valheim Dedicated Server
* FILE: SECURITY-GROUPS :: Main.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 5
*/

resource "aws_security_group" "valheim_external_ports"  {
    name = "Allow Valheim Ports"
    description = "Allow Valheim Ports"
    vpc_id = var.vpc_id

    #######TCP#########
    ingress {
        from_port       = 2456
        to_port         = 2458
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress{
        from_port       = 27015
        to_port         = 27030
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress{
        from_port       = 27036
        to_port         = 27037
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    #######UDP#########
    ingress{
        from_port       = 2456
        to_port         = 2458
        protocol        = "udp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
        ingress{
        from_port       = 4380
        to_port         = 4380
        protocol        = "udp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress{
        from_port       = 27000
        to_port         = 27031
        protocol        = "udp"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    ingress{
        from_port       = 27036
        to_port         = 27036
        protocol        = "udp"
        cidr_blocks     = ["0.0.0.0/0"]
    }

    egress{
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = {
        Name = "TF_Valheim_Ports"
    }
}

## SSH
resource "aws_security_group" "ssh" {
    name        = "Secure Shell"
    description = "SSH Communication"
    vpc_id = var.vpc_id

    ingress{
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        cidr_blocks     = var.your_ip
    }

    egress{
        from_port       = 0
        to_port         = 0
        protocol        = "-1"
        cidr_blocks     = ["0.0.0.0/0"]
    }
    tags = {
        Name = "TF_SSH"
    }
}