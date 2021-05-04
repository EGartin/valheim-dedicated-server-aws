/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 01
*/

provider aws {
    region = "REGION CODE"
    #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md
    access_key = "ACCESS_KEY"
    secret_key = "SECRET_KEY"
}