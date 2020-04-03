```
SuccessConsole Output
Started by user devops
Running in Durability level: MAX_SURVIVABILITY
[Pipeline] Start of Pipeline
[Pipeline] node
Running on Jenkins in /var/lib/jenkins/workspace/install_bahmni
[Pipeline] {
[Pipeline] stage
[Pipeline] { (GIT)
[Pipeline] git
No credentials specified
 > git rev-parse --is-inside-work-tree # timeout=10
Fetching changes from the remote Git repository
 > git config remote.origin.url https://github.com/dhana9000/Application-Deployment-Bahmni
.git # timeout=10
Fetching upstream changes from https://github.com/dhana9000/Application-Deployment-Bahmni
.git
 > git --version # timeout=10
 > git fetch --tags --progress -- https://github.com/dhana9000/Application-Deployment-Bahmni
.git +refs/heads/*:refs/remotes/origin/* # timeout=10
 > git rev-parse refs/remotes/origin/master^{commit} # timeout=10
 > git rev-parse refs/remotes/origin/origin/master^{commit} # timeout=10
Checking out Revision 2ca9acc67114aae452e15cc7ffd53266aae4a79e (refs/remotes/origin/master)
 > git config core.sparsecheckout # timeout=10
 > git checkout -f 2ca9acc67114aae452e15cc7ffd53266aae4a79e # timeout=10
 > git branch -a -v --no-abbrev # timeout=10
 > git branch -D master # timeout=10
 > git checkout -b master 2ca9acc67114aae452e15cc7ffd53266aae4a79e # timeout=10
Commit message: "Update script.sh"
 > git rev-list --no-walk 202889e4e5ce741950ba10394a6ae3a49d6aff8d # timeout=10
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (terraform init)
[Pipeline] sh
+ terraform init .

[0m[1mInitializing the backend...[0m

[0m[1mInitializing provider plugins...[0m

The following providers do not have any version constraints in configuration,
so the latest version was installed.

To prevent automatic upgrades to new major versions that may contain breaking
changes, it is recommended to add version = "..." constraints to the
corresponding provider blocks in configuration, with the constraint strings
suggested below.

* provider.aws: version = "~> 2.56"

[0m[1m[32mTerraform has been successfully initialized![0m[32m[0m
[0m[32m
You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.[0m
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (terraform validate)
[Pipeline] sh
+ terraform validate .
[33m
[1m[33mWarning: [0m[0m[1mQuoted type constraints are deprecated[0m

[0m  on input.tf line 2, in variable "access":
   2:     type= [4m"string"[0m
[0m
Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".

(and 2 more similar warnings elsewhere)
[0m[0m
[33m
[1m[33mWarning: [0m[0m[1mInterpolation-only expressions are deprecated[0m

[0m  on resource.tf line 11, in resource "aws_instance" "Ansible":
  11:         host= [4m"${aws_instance.Ansible.public_ip}"[0m
[0m
Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and one more similar warning elsewhere)
[0m[0m
[32m[1mSuccess![0m The configuration is valid, but there were some validation warnings as shown above.
[0m
[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (terraform plan)
[Pipeline] sh
+ terraform plan -var access=<Access_key> -var secret=<secret_key> -out=aws.plan .
[0m[1mRefreshing Terraform state in-memory prior to plan...[0m
The refreshed state will be used to calculate this plan, but will not be
persisted to local or remote state storage.
[0m
[0m[1maws_instance.Ansible: Refreshing state... [id=i-01108e97b37ee9455][0m

------------------------------------------------------------------------

An execution plan has been generated and is shown below.
Resource actions are indicated with the following symbols:
  [32m+[0m create
[0m
Terraform will perform the following actions:

[1m  # aws_instance.Ansible[0m will be created[0m[0m
[0m  [32m+[0m[0m resource "aws_instance" "Ansible" {
      [32m+[0m [0m[1m[0mami[0m[0m                          = "ami-0affd4508a5d2481b"
      [32m+[0m [0m[1m[0marn[0m[0m                          = (known after apply)
      [32m+[0m [0m[1m[0massociate_public_ip_address[0m[0m  = (known after apply)
      [32m+[0m [0m[1m[0mavailability_zone[0m[0m            = (known after apply)
      [32m+[0m [0m[1m[0mcpu_core_count[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mcpu_threads_per_core[0m[0m         = (known after apply)
      [32m+[0m [0m[1m[0mget_password_data[0m[0m            = false
      [32m+[0m [0m[1m[0mhost_id[0m[0m                      = (known after apply)
      [32m+[0m [0m[1m[0mid[0m[0m                           = (known after apply)
      [32m+[0m [0m[1m[0minstance_state[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0minstance_type[0m[0m                = "t2.large"
      [32m+[0m [0m[1m[0mipv6_address_count[0m[0m           = (known after apply)
      [32m+[0m [0m[1m[0mipv6_addresses[0m[0m               = (known after apply)
      [32m+[0m [0m[1m[0mkey_name[0m[0m                     = "jenkins"
      [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m         = (known after apply)
      [32m+[0m [0m[1m[0mpassword_data[0m[0m                = (known after apply)
      [32m+[0m [0m[1m[0mplacement_group[0m[0m              = (known after apply)
      [32m+[0m [0m[1m[0mprimary_network_interface_id[0m[0m = (known after apply)
      [32m+[0m [0m[1m[0mprivate_dns[0m[0m                  = (known after apply)
      [32m+[0m [0m[1m[0mprivate_ip[0m[0m                   = (known after apply)
      [32m+[0m [0m[1m[0mpublic_dns[0m[0m                   = (known after apply)
      [32m+[0m [0m[1m[0mpublic_ip[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0msecurity_groups[0m[0m              = [
          [32m+[0m [0m"launch-wizard-1",
        ]
      [32m+[0m [0m[1m[0msource_dest_check[0m[0m            = true
      [32m+[0m [0m[1m[0msubnet_id[0m[0m                    = (known after apply)
      [32m+[0m [0m[1m[0mtags[0m[0m                         = {
          [32m+[0m [0m"Name" = "Ansible"
        }
      [32m+[0m [0m[1m[0mtenancy[0m[0m                      = (known after apply)
      [32m+[0m [0m[1m[0mvolume_tags[0m[0m                  = (known after apply)
      [32m+[0m [0m[1m[0mvpc_security_group_ids[0m[0m       = (known after apply)

      [32m+[0m [0mebs_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_name[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0msnapshot_id[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }

      [32m+[0m [0mephemeral_block_device {
          [32m+[0m [0m[1m[0mdevice_name[0m[0m  = (known after apply)
          [32m+[0m [0m[1m[0mno_device[0m[0m    = (known after apply)
          [32m+[0m [0m[1m[0mvirtual_name[0m[0m = (known after apply)
        }

      [32m+[0m [0mmetadata_options {
          [32m+[0m [0m[1m[0mhttp_endpoint[0m[0m               = (known after apply)
          [32m+[0m [0m[1m[0mhttp_put_response_hop_limit[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mhttp_tokens[0m[0m                 = (known after apply)
        }

      [32m+[0m [0mnetwork_interface {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mdevice_index[0m[0m          = (known after apply)
          [32m+[0m [0m[1m[0mnetwork_interface_id[0m[0m  = (known after apply)
        }

      [32m+[0m [0mroot_block_device {
          [32m+[0m [0m[1m[0mdelete_on_termination[0m[0m = (known after apply)
          [32m+[0m [0m[1m[0mencrypted[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0miops[0m[0m                  = (known after apply)
          [32m+[0m [0m[1m[0mkms_key_id[0m[0m            = (known after apply)
          [32m+[0m [0m[1m[0mvolume_id[0m[0m             = (known after apply)
          [32m+[0m [0m[1m[0mvolume_size[0m[0m           = (known after apply)
          [32m+[0m [0m[1m[0mvolume_type[0m[0m           = (known after apply)
        }
    }

[0m[1mPlan:[0m 1 to add, 0 to change, 0 to destroy.[0m
[33m
[1m[33mWarning: [0m[0m[1mQuoted type constraints are deprecated[0m

[0m  on input.tf line 2, in variable "access":
   2:     type= [4m"string"[0m
[0m
Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".

(and 2 more similar warnings elsewhere)
[0m[0m
[33m
[1m[33mWarning: [0m[0m[1mInterpolation-only expressions are deprecated[0m

[0m  on resource.tf line 11, in resource "aws_instance" "Ansible":
  11:         host= [4m"${aws_instance.Ansible.public_ip}"[0m
[0m
Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and one more similar warning elsewhere)
[0m[0m

------------------------------------------------------------------------

This plan was saved to: aws.plan

To perform exactly these actions, run the following command to apply:
    terraform apply "aws.plan"

[Pipeline] }
[Pipeline] // stage
[Pipeline] stage
[Pipeline] { (terraform apply)
[Pipeline] sh
+ terraform apply aws.plan
[0m[1maws_instance.Ansible: Creating...[0m[0m
[0m[1maws_instance.Ansible: Still creating... [10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'file'...[0m[0m
[0m[1maws_instance.Ansible: Still creating... [30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [1m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [1m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [1m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'file'...[0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'file'...[0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'file'...[0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'file'...[0m[0m
[0m[1maws_instance.Ansible: Provisioning with 'remote-exec'...[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Connecting to remote host via SSH...
aws_instance.Ansible (remote-exec):   Host: 3.84.18.50
aws_instance.Ansible (remote-exec):   User: centos
aws_instance.Ansible (remote-exec):   Password: false
aws_instance.Ansible (remote-exec):   Private key: true
aws_instance.Ansible (remote-exec):   Certificate: false
aws_instance.Ansible (remote-exec):   SSH Agent: false
aws_instance.Ansible (remote-exec):   Checking Host Key: false
[0m[0maws_instance.Ansible (remote-exec): Connected!
[0m[1maws_instance.Ansible: Still creating... [1m30s elapsed][0m[0m
[0m[0maws_instance.Ansible (remote-exec): Redirecting to /bin/systemctl restart sshd.service
[0m[0maws_instance.Ansible (remote-exec): Loaded plugins: fastestmirror
[0m[0maws_instance.Ansible (remote-exec): Determining fastest mirrors
[0m[0maws_instance.Ansible (remote-exec):  * base: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec):  * extras: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec):  * updates: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec): base             | 3.6 kB     00:00
[0m[0maws_instance.Ansible (remote-exec): extras           | 2.9 kB     00:00
[0m[0maws_instance.Ansible (remote-exec): updates          | 2.9 kB     00:00
[0m[0maws_instance.Ansible (remote-exec): (1/4): base/7/x86_ | 165 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (2/4): extras/7/x8 | 165 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (3/4): updates/7/x | 7.6 MB   00:00
[0m[0maws_instance.Ansible (remote-exec): (4/4): base/7/ 56% | 7.9 MB   --:-- ETA
[0m[0maws_instance.Ansible (remote-exec): (4/4): base/7/ 59% | 8.3 MB   00:09 ETA
[0m[0maws_instance.Ansible (remote-exec): (4/4): base/7/x86_ | 6.0 MB   00:00
[0m[0maws_instance.Ansible (remote-exec): Resolving Dependencies
[0m[0maws_instance.Ansible (remote-exec): --> Running transaction check
[0m[0maws_instance.Ansible (remote-exec): ---> Package ansible.noarch 0:2.4.2.0-2.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: sshpass for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python2-jmespath for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-passlib for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-paramiko for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-httplib2 for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-cryptography for package: ansible-2.4.2.0-2.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Running transaction check
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-httplib2.noarch 0:0.9.2-1.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-paramiko.noarch 0:2.1.1-9.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python2-pyasn1 for package: python-paramiko-2.1.1-9.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-passlib.noarch 0:1.6.5-2.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): ---> Package python2-cryptography.x86_64 0:1.7.2-2.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-idna >= 2.0 for package: python2-cryptography-1.7.2-2.el7.x86_64
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-cffi >= 1.4.1 for package: python2-cryptography-1.7.2-2.el7.x86_64
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-enum34 for package: python2-cryptography-1.7.2-2.el7.x86_64
[0m[0maws_instance.Ansible (remote-exec): ---> Package python2-jmespath.noarch 0:0.9.0-3.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): ---> Package sshpass.x86_64 0:1.06-2.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Running transaction check
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-cffi.x86_64 0:1.6.0-5.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-pycparser for package: python-cffi-1.6.0-5.el7.x86_64
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-enum34.noarch 0:1.0.4-1.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-idna.noarch 0:2.4-1.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): ---> Package python2-pyasn1.noarch 0:0.1.9-7.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Running transaction check
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-pycparser.noarch 0:2.14-1.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Processing Dependency: python-ply for package: python-pycparser-2.14-1.el7.noarch
[0m[0maws_instance.Ansible (remote-exec): --> Running transaction check
[0m[0maws_instance.Ansible (remote-exec): ---> Package python-ply.noarch 0:3.4-11.el7 will be installed
[0m[0maws_instance.Ansible (remote-exec): --> Finished Dependency Resolution
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Dependencies Resolved
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): ========================================
[0m[0maws_instance.Ansible (remote-exec):  Package
[0m[0maws_instance.Ansible (remote-exec):       Arch   Version       Repository
[0m[0maws_instance.Ansible (remote-exec):                                    Size
[0m[0maws_instance.Ansible (remote-exec): ========================================
[0m[0maws_instance.Ansible (remote-exec): Installing:
[0m[0maws_instance.Ansible (remote-exec):  ansible
[0m[0maws_instance.Ansible (remote-exec):       noarch 2.4.2.0-2.el7 extras 7.6 M
[0m[0maws_instance.Ansible (remote-exec): Installing for dependencies:
[0m[0maws_instance.Ansible (remote-exec):  python-cffi
[0m[0maws_instance.Ansible (remote-exec):       x86_64 1.6.0-5.el7   base   218 k
[0m[0maws_instance.Ansible (remote-exec):  python-enum34
[0m[0maws_instance.Ansible (remote-exec):       noarch 1.0.4-1.el7   base    52 k
[0m[0maws_instance.Ansible (remote-exec):  python-httplib2
[0m[0maws_instance.Ansible (remote-exec):       noarch 0.9.2-1.el7   extras 115 k
[0m[0maws_instance.Ansible (remote-exec):  python-idna
[0m[0maws_instance.Ansible (remote-exec):       noarch 2.4-1.el7     base    94 k
[0m[0maws_instance.Ansible (remote-exec):  python-paramiko
[0m[0maws_instance.Ansible (remote-exec):       noarch 2.1.1-9.el7   base   269 k
[0m[0maws_instance.Ansible (remote-exec):  python-passlib
[0m[0maws_instance.Ansible (remote-exec):       noarch 1.6.5-2.el7   extras 488 k
[0m[0maws_instance.Ansible (remote-exec):  python-ply
[0m[0maws_instance.Ansible (remote-exec):       noarch 3.4-11.el7    base   123 k
[0m[0maws_instance.Ansible (remote-exec):  python-pycparser
[0m[0maws_instance.Ansible (remote-exec):       noarch 2.14-1.el7    base   104 k
[0m[0maws_instance.Ansible (remote-exec):  python2-cryptography
[0m[0maws_instance.Ansible (remote-exec):       x86_64 1.7.2-2.el7   base   502 k
[0m[0maws_instance.Ansible (remote-exec):  python2-jmespath
[0m[0maws_instance.Ansible (remote-exec):       noarch 0.9.0-3.el7   extras  39 k
[0m[0maws_instance.Ansible (remote-exec):  python2-pyasn1
[0m[0maws_instance.Ansible (remote-exec):       noarch 0.1.9-7.el7   base   100 k
[0m[0maws_instance.Ansible (remote-exec):  sshpass
[0m[0maws_instance.Ansible (remote-exec):       x86_64 1.06-2.el7    extras  21 k
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Transaction Summary
[0m[0maws_instance.Ansible (remote-exec): ========================================
[0m[0maws_instance.Ansible (remote-exec): Install  1 Package (+12 Dependent packages)
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Total download size: 9.7 M
[0m[0maws_instance.Ansible (remote-exec): Installed size: 49 M
[0m[0maws_instance.Ansible (remote-exec): Downloading packages:
[0m[0maws_instance.Ansible (remote-exec): warning: /var/cache/yum/x86_64/7/base/packages/python-cffi-1.6.0-5.el7.x86_64.rpm: Header V3 RSA/SHA256 Signature, key ID f4a80eb5: NOKEY
[0m[0maws_instance.Ansible (remote-exec): Public key for python-cffi-1.6.0-5.el7.x86_64.rpm is not installed
[0m[0maws_instance.Ansible (remote-exec): (1/13): python-cff | 218 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (2/13): python-idn |  94 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (3/13): python-par | 269 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): Public key for python-httplib2-0.9.2-1.el7.noarch.rpm is not installed
[0m[0maws_instance.Ansible (remote-exec): (4/13): python-htt | 115 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (5/13): python-pas | 488 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (6/13): python-ply | 123 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (7/13): ansible-2. | 7.6 MB   00:00
[0m[0maws_instance.Ansible (remote-exec): (8/13): python-pyc | 104 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (9/13): python2-cr | 502 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (10/13): python2-p | 100 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (11/13): python2-j |  39 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (12/13): python-en |  52 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): (13/13): sshpass-1 |  21 kB   00:00
[0m[0maws_instance.Ansible (remote-exec): ----------------------------------------
[0m[0maws_instance.Ansible (remote-exec): Total       25 MB/s | 9.7 MB  00:00
[0m[0maws_instance.Ansible (remote-exec): Retrieving key from file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
[0m[0maws_instance.Ansible (remote-exec): Importing GPG key 0xF4A80EB5:
[0m[0maws_instance.Ansible (remote-exec):  Userid     : "CentOS-7 Key (CentOS 7 Official Signing Key) <security@centos.org>"
[0m[0maws_instance.Ansible (remote-exec):  Fingerprint: 6341 ab27 53d7 8a78 a7c2 7bb1 24c6 a8a7 f4a8 0eb5
[0m[0maws_instance.Ansible (remote-exec):  Package    : centos-release-7-7.1908.0.el7.centos.x86_64 (installed)
[0m[0maws_instance.Ansible (remote-exec):  From       : /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
[0m[0maws_instance.Ansible (remote-exec): Running transaction check
[0m[0maws_instance.Ansible (remote-exec): Running transaction test
[0m[0maws_instance.Ansible (remote-exec): Transaction test succeeded
[0m[0maws_instance.Ansible (remote-exec): Running transaction
[0m[0maws_instance.Ansible (remote-exec):   Installing : python2 [        ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#       ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [##      ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [###     ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####    ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#####   ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [######  ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####### ]  1/13
aws_instance.Ansible (remote-exec):   Installing : python2-pyasn1-0    1/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  2/13
aws_instance.Ansible (remote-exec):   Installing : python-enum34-1.    2/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  3/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  3/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  3/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  3/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  3/13
aws_instance.Ansible (remote-exec):   Installing : python-httplib2-    3/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : sshpass [        ]  4/13
aws_instance.Ansible (remote-exec):   Installing : sshpass [###     ]  4/13
aws_instance.Ansible (remote-exec):   Installing : sshpass [######  ]  4/13
aws_instance.Ansible (remote-exec):   Installing : sshpass [####### ]  4/13
aws_instance.Ansible (remote-exec):   Installing : sshpass-1.06-2.e    4/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python2 [        ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#       ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [##      ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [###     ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####    ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#####   ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [######  ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####### ]  5/13
aws_instance.Ansible (remote-exec):   Installing : python2-jmespath    5/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  6/13
aws_instance.Ansible (remote-exec):   Installing : python-passlib-1    6/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  7/13
aws_instance.Ansible (remote-exec):   Installing : python-ply-3.4-1    7/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  8/13
aws_instance.Ansible (remote-exec):   Installing : python-pycparser    8/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ]  9/13
aws_instance.Ansible (remote-exec):   Installing : python-cffi-1.6.    9/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ] 10/13
aws_instance.Ansible (remote-exec):   Installing : python-idna-2.4-   10/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python2 [        ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#       ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [##      ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [###     ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####    ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [#####   ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [######  ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2 [####### ] 11/13
aws_instance.Ansible (remote-exec):   Installing : python2-cryptogr   11/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : python- [        ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [#       ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [##      ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [###     ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [####    ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [#####   ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [######  ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python- [####### ] 12/13
aws_instance.Ansible (remote-exec):   Installing : python-paramiko-   12/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [        ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [#       ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [##      ] 13/13
[0m[1maws_instance.Ansible: Still creating... [1m40s elapsed][0m[0m
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [###     ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [####    ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [#####   ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [######  ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible [####### ] 13/13
[0m[0maws_instance.Ansible (remote-exec):   Installing : ansible-2.4.2.0-   13/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-idna-2.4-    1/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-pycparser    2/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-ply-3.4-1    3/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-passlib-1    4/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python2-jmespath    5/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-paramiko-    6/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : ansible-2.4.2.0-    7/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-cffi-1.6.    8/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : sshpass-1.06-2.e    9/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-httplib2-   10/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python2-pyasn1-0   11/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python-enum34-1.   12/13
[0m[0maws_instance.Ansible (remote-exec):   Verifying  : python2-cryptogr   13/13
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Installed:
[0m[0maws_instance.Ansible (remote-exec):   ansible.noarch 0:2.4.2.0-2.el7
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Dependency Installed:
[0m[0maws_instance.Ansible (remote-exec):   python-cffi.x86_64 0:1.6.0-5.el7
[0m[0maws_instance.Ansible (remote-exec):   python-enum34.noarch 0:1.0.4-1.el7
[0m[0maws_instance.Ansible (remote-exec):   python-httplib2.noarch 0:0.9.2-1.el7
[0m[0maws_instance.Ansible (remote-exec):   python-idna.noarch 0:2.4-1.el7
[0m[0maws_instance.Ansible (remote-exec):   python-paramiko.noarch 0:2.1.1-9.el7
[0m[0maws_instance.Ansible (remote-exec):   python-passlib.noarch 0:1.6.5-2.el7
[0m[0maws_instance.Ansible (remote-exec):   python-ply.noarch 0:3.4-11.el7
[0m[0maws_instance.Ansible (remote-exec):   python-pycparser.noarch 0:2.14-1.el7
[0m[0maws_instance.Ansible (remote-exec):   python2-cryptography.x86_64 0:1.7.2-2.el7
[0m[0maws_instance.Ansible (remote-exec):   python2-jmespath.noarch 0:0.9.0-3.el7
[0m[0maws_instance.Ansible (remote-exec):   python2-pyasn1.noarch 0:0.1.9-7.el7
[0m[0maws_instance.Ansible (remote-exec):   sshpass.x86_64 0:1.06-2.el7
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Complete!
[0m[0maws_instance.Ansible (remote-exec): Loaded plugins: fastestmirror
[0m[0maws_instance.Ansible (remote-exec): Loading mirror speeds from cached hostfile
[0m[0maws_instance.Ansible (remote-exec):  * base: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec):  * extras: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec):  * updates: d36uatko69830t.cloudfront.net
[0m[0maws_instance.Ansible (remote-exec): Package sshpass-1.06-2.el7.x86_64 already installed and latest version
[0m[0maws_instance.Ansible (remote-exec): Nothing to do
[0m[0maws_instance.Ansible (remote-exec): /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/centos/.ssh/id_rsa.pub"
[0m[0maws_instance.Ansible (remote-exec): /usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
[0m[0maws_instance.Ansible (remote-exec): /usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Number of key(s) added: 1
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): Now try logging into the machine, with:   "ssh -o 'StrictHostKeyChecking=no' 'root@localhost'"
[0m[0maws_instance.Ansible (remote-exec): and check to make sure that only the key(s) you wanted were added.
[0m[0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): PLAY [all] *********************************************************************
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [Gathering Facts] *********************************************************
[0m[0maws_instance.Ansible (remote-exec): [0;32mok: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [This executes only on centos machine] ************************************
[0m[0maws_instance.Ansible (remote-exec): [0;36mskipping: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [installation of Bahmni] **************************************************
[0m[1maws_instance.Ansible: Still creating... [1m50s elapsed][0m[0m
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost] => (item=[u'https://kojipkgs.fedoraproject.org//packages/zlib/1.2.11/19.fc30/x86_64/zlib-1.2.11-19.fc30.x86_64.rpm', u'https://dl.bintray.com/bahmni/rpm/rpms/bahmni-installer-0.92-147.noarch.rpm'])[0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [setup a configuration file for bahmni command in /etc/bahmni-installer] ***
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [Copy the required config folder to /etc/bahmni-installer/deployment-artifacts] ***
[0m[1maws_instance.Ansible: Still creating... [2m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [2m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [2m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [2m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [2m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [2m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [3m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [3m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [3m20s elapsed][0m[0m
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [Set the inventory file name to local in BAHMNI_INVENTORY environment variable] ***
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): TASK [Now fire the installer] **************************************************
[0m[1maws_instance.Ansible: Still creating... [3m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [3m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [3m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [4m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [5m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [6m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [7m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [8m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [9m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [10m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [11m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [12m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [13m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [14m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [15m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m30s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m40s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [16m50s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [17m0s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [17m10s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [17m20s elapsed][0m[0m
[0m[1maws_instance.Ansible: Still creating... [17m30s elapsed][0m[0m
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): RUNNING HANDLER [refresh .bashrc] **********************************************
[0m[0maws_instance.Ansible (remote-exec): [0;33mchanged: [localhost][0m
[0m[0m
[0m[0maws_instance.Ansible (remote-exec): PLAY RECAP *********************************************************************
[0m[0maws_instance.Ansible (remote-exec): [0;33mlocalhost[0m                  : [0;32mok=7   [0m [0;33mchanged=6   [0m unreachable=0    failed=0
[0m[0m
[0m[1maws_instance.Ansible: Creation complete after 17m40s [id=i-028b781b5150105c0][0m[0m
[33m
[1m[33mWarning: [0m[0m[1mQuoted type constraints are deprecated[0m

[0m  on input.tf line 2, in variable "access":
   2:     type= [4m"string"[0m
[0m
Terraform 0.11 and earlier required type constraints to be given in quotes,
but that form is now deprecated and will be removed in a future version of
Terraform. To silence this warning, remove the quotes around "string".

(and 2 more similar warnings elsewhere)
[0m[0m
[33m
[1m[33mWarning: [0m[0m[1mInterpolation-only expressions are deprecated[0m

[0m  on resource.tf line 11, in resource "aws_instance" "Ansible":
  11:         host= [4m"${aws_instance.Ansible.public_ip}"[0m
[0m
Terraform 0.11 and earlier required all non-constant expressions to be
provided via interpolation syntax, but this pattern is now deprecated. To
silence this warning, remove the "${ sequence from the start and the }"
sequence from the end of this expression, leaving just the inner expression.

Template interpolation syntax is still used to construct strings from
expressions when the template includes multiple interpolation sequences or a
mixture of literal strings and interpolations. This deprecation applies only
to templates that consist entirely of a single interpolation sequence.

(and one more similar warning elsewhere)
[0m[0m
[0m[1m[32m
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.[0m
[0m
The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate[0m
[Pipeline] }
[Pipeline] // stage
[Pipeline] }
[Pipeline] // node
[Pipeline] End of Pipeline
Finished: SUCCESS
```