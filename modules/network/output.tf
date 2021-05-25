/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Output.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 25
*/

#NETWORK DETAILS
output "valheim-vpc"{
    value = aws_vpc.valheim-vpc.id
}
output "network_subnet_id"{
    #value = [aws_subnet.valheim-subnets-10[0].id]
    value = length(aws_subnet.valheim-subnets-10.*.id)>0 ? element(concat(aws_subnet.valheim-subnets-10.*.id, tolist([""])),0): ""
}
output "network_subnet_id_list" {
    value = aws_subnet.valheim-subnets-10.*.id
}
