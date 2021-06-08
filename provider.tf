/*
* PROJECT: Valheim Dedicated Server
* FILE: ROOT :: Provider.tf
* AUTHOR: Elijah Gartin [elijah.gartin@gmail.com]
* DATE: 2021 MAY 25
*/

provider "aws" {
  region = "us-west-2"
  #Only use these if you are secure and not sharing your code. Otherwise use more secure methods discussed in README.md
  access_key = "AKIAU4YHFS7MQU7SZ56U"
  secret_key = "Dwe1aEeQ1uGoYe2Nrs5dGoZe3TUK2dWXV55bdZOx"
}