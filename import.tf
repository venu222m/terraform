# terraform import command to import existing infrastructure resources so that you can manage them as code.
#terraform import command to import existing infrastructure to Terraform state.
#The terraform import command can only import one resource at a time. 
#It cannot simultaneously import an entire collection of resources, such as an AWS VPC.

#This command locates the AWS EC2 instance with ID i-abcd1234. 
#Then it attaches the existing settings of the instance,
#as described by the EC2 API, to the name aws_instance.example of a module.
#In this example, the module path implies that the root module is used. 
#Finally, the mapping is saved in the Terraform state.


#Run terraform import to attach an existing instance to the resource configuration:

step1 : terraform import aws_instance.example i-abcd1234

step2 : 
resource "aws_instance" "example" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t2.micro"
  

  tags = {
    Name = "DEVOPS"
  }
}

