/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Vars.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 JUN 08
*/

variable "env_type" {
    description = "Use your own tagging taxonomy to attach resources to specific environments. I.E. Production,Testing, QA, etc."
    default = "TESTING"
}

variable "your_ip"  {
    description = "README.md :: Step 1: This must be your public facing IP so you can SSH to your linux machine. You can use the 'get-your-ip.sh' script and then end this variable in the vars.tf"
    default     = ["83.136.182.238/32"]
}

variable "keyname"  {
    description = "README.md :: Step 2: This is your keyname from your EC2 Console."
    default = "TRG-STREAM-TEST"
}

variable "instance_type"    {
    description = "This the aws coded instance type for the server that will be built. For initial production, we'll use t3.medium. For testing, you can use a t3.micro."
    default = "t3.medium"
}

variable "volume_size"  {
    description = "This will be the size of your root disk."
    default = "30"
}

variable "volume_type"  {
    description = "This is the class of storage. We'll use gp2 as it is a general class of storage that is cheaper than higher i/o storage."
    default = "gp2"
}
