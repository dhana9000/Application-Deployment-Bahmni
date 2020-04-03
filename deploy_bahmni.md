## Application deployment (Bahmni)
### Use of Bahmni
* Bahmni is an easy-to-use EMR & hospital system.
* It combines and enhances existing open source products into a single solution.
### System Requirements 
* CPU - Quad core (8 core, if in future you would want to run PACS integration from the same server)
* Memory - 8 GB (16 GB, if in future you would want to run PACS integration from the same server)
* Hard disk - 500GB  (doesn't include the disk space needed for PACS integration or if you plan to upload a lot of files/images)
### Access the Application
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image2.PNG)  

### Manual steps for installing bahmni on centos
* Installation steps are referred from [here](https://www.bahmni.org/install) 

````
#Steps for Installing Bahmni v0.92

#Prerequisite for the fresh installation of Bahmni
yum install -y https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm
 
 
# Install the bahmni command line program (Choose the version you want).
yum install https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm
 
# Confirm that the bahmni command is correctly installed (you should see a help message for the command)
bahmni --help
  
# Now setup a configuration file for bahmni command in /etc/bahmni-installer.
curl -L https://tinyurl.com/yyoj98df >> /etc/bahmni-installer/setup.yml
  
# Confirm the contents of the file. It should look like this file: (https://goo.gl/R8ekg5)
cat /etc/bahmni-installer/setup.yml
 
# The above setup.yml, has a timezone entry. You can change it to suit your timezone if you like. For valid options
# please read this document: https://bahmni.atlassian.net/wiki/display/BAH/List+Of+Configurable+Installation+Variables
 
# Set the inventory file name to local in BAHMNI_INVENTORY environment variable. This way you won't need to use the '-i local' switch every time you use the 'bahmni' command
#You can also configure custom inventory file instead of local.
echo "export BAHMNI_INVENTORY=local" >> ~/.bashrc
source ~/.bashrc
  
# Now fire the installer
bahmni install 
  
# The installation should be done in about 15 - 30 minutes depending on your internet speed.
# Verify installed components using the command:
yum list installed | grep bahmni
````
### using fresh Database
* Steps are refereed form [Here](https://bahmni.atlassian.net/wiki/spaces/BAH/pages/45776970/Using+a+Fresh+Database)
#### Purpose and Benefits
Bahmni comes with an out-of-the-box demo database. However, after installing Bahmni, one might test the system by doing some data entry. This would create some transactional data about Patients, Visits, Encounters, Observations, Orders, etc. Creating a fresh database helps in removing such transactional data so that the database (with proper Metadata setup) can be used in other deployments. This Documentation will help you setting up the basic vanilla database with minimum data to access all the modules in Bahmni.
#### Steps for Installing Bahmni for Vanilla OpenMRS DB
* To get a fresh Bahmni database, you need to install Bahmni, by setting the implementation name (implementation_name in setup.yml) as anything BESIDES "default". For instance, you may call it: "myhospital".
* setup.yml file should be like
```
# To see the list of valid variables in Bahmni please refer to:
# https://bahmni.atlassian.net/wiki/display/BAH/List+Of+Configurable+Installation+Variables

timezone: Asia/Kolkata
implementation_name: <implementation_name>
selinux_state: disabled
```
* Copy the required config folder from [here](https://github.com/Bahmni/default-config/archive/master.zip) to /etc/bahmni-installer/deployment-artifacts and rename config folder to (implementation name)_config for example: __myhospital_config__.
* Run the bahmni install command.

### Write play book for installing bahmni using Ansible
* It is named as bahmni.yml
````
---
- hosts: all
  remote_user: root
  vars:
    bahmni_install:
      - https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm
      - https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm
  tasks:
    - name: This executes only on centos machine
      fail:
        msg: unsupported distribution
      when: ansible_distribution != 'CentOS'
    - name: installation of Bahmni
      yum:
        name: "{{ item }}"
        state: present
      with_items: "{{ bahmni_install }}"
    - name: setup a configuration file for bahmni command in /etc/bahmni-installer
      template :
        src : /tmp/setup.yml.j2
        dest : /etc/bahmni-installer/setup.yml
    - name: Copy the required config folder to /etc/bahmni-installer/deployment-artifacts
      copy:
        src: /tmp/hospital_config
        dest: /etc/bahmni-installer/deployment-artifacts/
    - name: Set the inventory file name to local in BAHMNI_INVENTORY environment variable
      shell:
        cmd: echo "export BAHMNI_INVENTORY=local" >> ~/.bashrc
      notify:
        - refresh .bashrc
    - name: Now fire the installer
      shell: bahmni install
  handlers:
    - name: refresh .bashrc
      shell: source ~/.bashrc
      args: 
        executable: /bin/bash
````  
#### Create inventory file
* create inventory file with localhost and name it as hosts.  
### Installing Ansible and executing playbook using Terraform
* Create EC2 on AWS with ansible installed in it.
* create the following .tf files 
  * [provider.tf](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/provider.tf)
  * [input.tf](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/input.tf)
  * [variables.tfvars](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/variables.tfvars)
  * [resource.tf](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/resource.tf)
  * [script.sh](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/script.sh)

### Configure Terraform with jenkins 
* Install terraform on jenkins master from [here](https://linoxide.com/linux-how-to/how-to-install-terraform-on-centos-ubuntu/)
* execute terraform script using jenkins pipeline.
* create a new pipeline project 
* configure terraform
  * Download terraform plugin
  * jenkins => GlobalTool configuration, configure terraform

  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image1.PNG)
#### Create pipeline
* write [Jenkinsfile](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/Jenkinsfile) and execute it via pipeline script from SCM 

![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image13.PNG)  
### Console Output
* To see the Output logs click [Here](./outputlogs.md).

  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image12.PNG)
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image3.PNG)
* After successful execution, New EC2 machine named Ansible will be created. 
* Obtain ip address from created machine and check weather application is running are not (http://machine-ip/home)

  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image4.PNG)

### Output Screens after Deploying Application

  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image5.PNG)

  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image6.PNG)
  
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image7.PNG)
  
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image8.PNG)
  
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image9.PNG)
  
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image10.PNG)
  
  ![image](https://github.com/dhana9000/Application-Deployment-Bahmni/blob/master/images/image11.PNG)















 
