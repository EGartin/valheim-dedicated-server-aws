/*
* PROJECT: Valheim Dedicated Server
* FILE: NETWORK :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 05
*/

variable "valheim-vpc" {
    default = "10.10.0.0/16"
}
variable "valheim-subnet-10"    {
    default = ["10.10.10.0/24","10.10.11.0/24","10.10.12.0/24","10.10.13.0/24","10.10.14.0/24","10.10.15.0/24","10.10.16.0/24"]
}