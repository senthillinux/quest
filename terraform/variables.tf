variable "region" {
	description = "AWS region for hosting our your network"
	default = "us-east-1"
}
variable "amis" {
 description = "Base AMI to launch the instances"
 default = {
 ap-south-1 = "ami-04505e74c0741db8d"
 }
}
