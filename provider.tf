/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAR 01
*/

provider aws {
    region = "us-west-1"
    #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md
    access_key = "AKIAU4YHFS7M2HIVQ5LW"
    secret_key = "5lb52X6+zrUcMXDABlY/3cDRGQVOA+/lPfmnThu0"
}