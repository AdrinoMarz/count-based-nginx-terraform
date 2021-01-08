# ---------------------------------------------------------------------------------------------------------------------
# DEPLOY A MULTIPLE EC2 INSTANCE which will run the mentioned things in user_data
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_instance" "amazon_ami" {
    count         = "${var.instance_count}"
    ami           = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name      = "mypemfile"
    user_data     = "${file("install_apache.txt")}"
    vpc_security_group_ids    = ["${aws_security_group.dynamic_sg.id}"]
    
    provisioner "remote-exec" {
        inline = [
            "sudo amazon-linux-extras install -y nginx1",
            "sudo systemctl start nginx"
        ]

    connection {
        host        = self.public_ip
        type        = "ssh"
        user        = "ec2-user"
        private_key = file("./mypemfile.pem")
     }
    }

    tags = {
        Name  = var.elb_name[count.index]
        Owner = "Adrino"
        Env   = "dev"
    }

}    