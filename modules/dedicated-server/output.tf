/*
* PROJECT: Valheim Dedicated Server
* FILE: DEDICATED-SERVER :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

output "instance_id"    {
    value = aws_instance.instance.id
}
output "name_tag"   {
    value = var.name_tag
}
output "public_ip"  {
    value = aws_eip.eip.public_ip
}
