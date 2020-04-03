resource "aws_instance" "Ansible" {
    ami= "ami-0affd4508a5d2481b"
    instance_type= "t2.large"
    key_name= "jenkins"
    security_groups= ["launch-wizard-1"]
    tags = {
        "Name" = "Ansible"
    }
    connection {
        user= "centos"
        host= "${aws_instance.Ansible.public_ip}"
        private_key= "${file("./jenkins.pem")}"
        
    }
    provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    }
    provisioner "file" {
    source      = "./bahmni.yml"
    destination = "/tmp/bahmni.yml"
    }
    provisioner "file" {
    source      = "hosts"
    destination = "/tmp/hosts"
    }
    provisioner "file" {
    source      = "setup.yml.j2"
    destination = "/tmp/setup.yml.j2"
    }
    provisioner "file" {
    source      = "hospital_config"
    destination = "/tmp/hospital_config"
    }
    provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
    }
  
}

