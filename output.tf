/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 25
*/

output "public_ip" {
    value = module.server.public_ip
}