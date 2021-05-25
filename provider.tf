/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 25
*/

provider "aws" {
  region = "..."
  #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md
  access_key = "..."
  secret_key = "..."
}