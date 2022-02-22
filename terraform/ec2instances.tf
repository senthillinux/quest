resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = "${file("terraform-demo.pub")}"
}


resource "aws_instance" "quest" {
	ami	= "ami-04505e74c0741db8d"
	instance_type	= "t2.micro"
	key_name	= "${aws_key_pair.terraform-demo.key_name}"
	vpc_security_group_ids = ["sg-08a6fe6f13602a68f"]
	subnet_id	= "subnet-05aa0b00938d4413e"
	user_data = "${file("install_script.sh")}"
	tags	= { ec2_create = "instance1" }
	}

output "instance_ids" {
    value = ["${aws_instance.quest.*.public_ip}"]
}

