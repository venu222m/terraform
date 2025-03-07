#length
#length determines the length of a given list, map, or string.

#If given a list or map, the result is the number of elements in that collection. If given a string, the result is the number of characters in the string.
> length([])
0
> length(["a", "b"])
2
> length({"a" = "b"})
1
> length("hello")
5
================================================ length understanding above code
# variables.tf
variable "ami" {
  type    = string
  default = "ami-0078ef784b6fa1ba4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "servers" {
  type    = list(string)
  default = ["server_one", "server_two", "server_three"]
}

# main.tf
resource "aws_instance" "vm" {
  ami           = var.ami
  instance_type = var.instance_type
  count         = length(var.servers)   #count=3 
  tags = {
    Name = var.sandboxes[count.index]
  }
}
==================understanding count.index and length use case above code
