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

